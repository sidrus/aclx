class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = @user.vehicles
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user_id = @user.id
    @vehicle.is_primary = true if (@user.vehicles.count == 0)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to user_vehicles_url(@user), notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)        
        @vehicle.ensure_primary if @vehicle.is_primary

        format.html { redirect_to user_vehicles_path(@user), notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to user_vehicles_url(@user), notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      begin
        @vehicle = Vehicle.find(params[:id])
      rescue Exception => e
        redirect_to user_vehicles_url(params[:user_id]), :flash => {errors: "Could not locate vehicle with ID=#{params[:id]}"}
      end
    end

    def set_user
      begin
        @user = User.find(params[:user_id])
      rescue Exception => e
        redirect_to user_vehicles_url(params[:user_id]), :flash => {errors: "Could not locate user with ID=#{params[:user_id]}"}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:nickname, :member_id, :color_id, :edition_id, :trim_id, :model_id, :is_primary, :vehicle_year)
    end
end
