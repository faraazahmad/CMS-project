class SessionsController < ApplicationController
  before_action :citizen_logged_in, only: [:new, :create]

  def new
  	@citizen = Citizen.new
  end

  def create
  	citizen = Citizen.find_by(id: params[:session][:id])
  	if citizen && citizen.authenticate(params[:session][:password])
  		log_in(citizen)
      flash[:success] = 'Logged in sucessfully.'
  		redirect_to citizen
  	else
  		# create error message
  		flash.now[:warning] = 'Inavlid UID/password combination'
	  	render :new
  	end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def citizen_logged_in
    if logged_in?
      flash[:warning] = "You need to log out first"
      redirect_to current_citizen
    end
  end
end
