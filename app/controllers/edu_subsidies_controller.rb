class EduSubsidiesController < ApplicationController
  before_action :set_edu_subsidy, only: [:show, :edit, :update, :destroy]
  before_action :admin_logged_in

  # GET /edu_subsidies
  def index
    @edu_subsidies = EduSubsidy.all
  end

  # GET /edu_subsidies/1
  def show
  end

  # GET /edu_subsidies/new
  def new
    @edu_subsidy = EduSubsidy.new
  end

  # POST /edu_subsidies
  def create
    @edu_subsidy = EduSubsidy.new(edu_subsidy_params)

    if @edu_subsidy.save
      id = @edu_subsidy.id
      citizen = Citizen.find(@edu_subsidy.citizen_id)
      citizen.update_attribute(:edu_subsidy_id, id)
      flash[:success] = 'Succesfully registered for Education Subsidy'
      redirect_to citizen
    else
      render :new
    end
  end

  # PATCH/PUT /edu_subsidies/1
  def update
    if @edu_subsidy.update(edu_subsidy_params)
      flash[:success] = 'Succesfully updated subsidy subscription'
      redirect_to @edu_subsidy
    else
      render :edit
    end
  end

  # DELETE /edu_subsidies/1
  def destroy
    id = @edu_subsidy.id
    citizen = Citizen.find(@edu_subsidy.citizen_id)
    citizen.update_attribute(:edu_subsidy_id, nil)
    ActiveRecord::Base.connection.query("
      DELETE FROM edu_subsidies WHERE id = #{id}
    ")
    flash[:success] = 'Succesfully unregistered from Education subsidy'
    redirect_to citizen
  end

  private
    def admin_logged_in
      unless admin_logged_in?
        flash[:warning] = "Please log in as admin first"
        redirect_to login_path
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_edu_subsidy
      @edu_subsidy = EduSubsidy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edu_subsidy_params
      params.require(:edu_subsidy).permit(:citizen_id)
    end
end
