class CitizensController < ApplicationController
  before_action :admin_logged_in, only: [:new, :create, :edit, :update]
  before_action :citizen_logged_in, only: [:show]

  def new
    @citizen = Citizen.new
  end

  def show
    if logged_in? && (current_citizen.admin == true || current_citizen.id = params[:id])
      @citizen = Citizen.find(params[:id])
    else
      flash[:warning] = "You can only view your own details"
      redirect_to current_citizen
    end
  end

  def create
  	@citizen = Citizen.new(citizen_params)
  	if @citizen.save
      log_in @citizen
      flash[:sucess] = "You have Succesfully registered!"
  		redirect_to @citizen
  	else
  		render :new
  	end
  end

  def edit
    @citizen = Citizen.find(params[:id])
  end

  def update
    @citizen = Citizen.find(params[:id])

    if @citizen.update_attributes(citizen_params)
      flash[:success] = "Details updated succesfully"
      redirect_to @citizen
    else
      render :edit
    end
  end

  private

  def admin_logged_in
    unless admin_logged_in?
      flash[:warning] = "Please log in as admin first"
      redirect_to login_path
    end
  end

  def citizen_logged_in
    unless logged_in?
      flash[:warning] = "Please log in first."
      redirect_to login_path
    end
  end

  def citizen_params
  	params.require(:citizen).permit(:name, :dob, :address, :phone_number,
  																	 :gender, :password, :password_confirmation,
  																	 :occupation, :marital_status, :admin)
  end
end
