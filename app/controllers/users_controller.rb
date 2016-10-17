class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    if params[:search] then
      @users = User.where("(lower(full_name) LIKE :search) OR (lower(forum_name) LIKE :search)", search: "%#{params[:search]}%".downcase)
    else
      @users = User.all.where(inactive: false)
    end

    @users = @users.order(:aclx_id).paginate(:page => params[:page], :per_page => 5)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)        
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_all
    User.delete_all
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'All users were successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # imports a list of users from a CSV or Excel file
  def import
    begin
      if params[:file].is_a? String then
        session = create_google_session
        file = session.file_by_url(params[:file])
        User.import_from_google(file)
      else
        User.import_from_upload(params[:file])
      end
      
      respond_to do  |format|
        format.html { redirect_to users_url, notice: "Member list imported." }
      end
    rescue Exception => e
      respond_to do |format|
        format.html {redirect_to users_url, :flash => {error: "Member imported failed.<br />#{e.message}')}"}}
      end
    end
  end

  # shows the user import view
  def import_show    
  end

  def import_google
    session = create_google_session
    return if session.nil?
    
    @aclx_files = session.collection_by_title("ACLX")
  end

  # returns a list of leadership users
  def leadership
    @users = User.where(is_leadership: true).order(:aclx_id).paginate(:page => params[:page], :per_page => 5)
    render :index
  end

  def print
    @user = User.find(params[:id])    
    render action: "print", layout: "print_id"    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :id_issued, :forum_name, :full_name, :email, :vehicle_desc, :date_joined, :has_facebook, :comments, :last_activity, :is_leadership, :aclx_id, :inactive)
    end

    def create_google_session
      require "googleauth"

      # create a new OAuth credential
      credentials = Google::Auth::UserRefreshCredentials.new(
        client_id: ENV["google_client_id"] || Rails.application.secrets[:google][:client_id],
        client_secret: ENV["google_client_secret"] || Rails.application.secrets[:google][:client_secret],
        scope: [
          "https://www.googleapis.com/auth/drive",
          "https://spreadsheets.google.com/feeds/",
        ],
        redirect_uri: ENV["google_redirect_uri"] || "http://localhost:3000/users/import_google"
      )
      
      if session[:google_auth_token] && !session[:google_auth_token].nil? then
        credentials.refresh_token = session[:google_auth_token]      
      else
        if params[:code].nil? then
          auth_url = credentials.authorization_uri
          redirect_to auth_url.to_s and return
        else
          credentials.code = params[:code]          
        end
      end

      credentials.fetch_access_token!
      session[:google_auth_token] = credentials.refresh_token

      session = GoogleDrive::Session.from_credentials(credentials)
    end
end
