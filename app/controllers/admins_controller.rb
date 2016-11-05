class AdminsController < ApplicationController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    @admins = Admin.all
  end

  def edit
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to edit_admin_path(@admin), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy    
    respond_to do |format|
      if @admin.destroy
        format.html { redirect_to admins_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to admins_url, notice: 'User was not successfully destroyed.' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
      params.require(:admin).permit(:email, :username, :approved, {role_ids: []})
    end
end
