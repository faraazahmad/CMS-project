class ElecSubsidiesController < ApplicationController
  before_action :set_elec_subsidy, only: [:show, :edit, :update, :destroy]
  before_action :admin_logged_in

  # GET /elec_subsidies
  def index
    @elec_subsidies = ElecSubsidy.all
  end

  # GET /elec_subsidies/1
  def show
  end

  # GET /elec_subsidies/new
  def new
    @elec_subsidy = ElecSubsidy.new
  end

  # POST /elec_subsidies
  def create
    @elec_subsidy = ElecSubsidy.new(elec_subsidy_params)

    if @elec_subsidy.save
      id = @elec_subsidy.id
      citizen = Citizen.find(@elec_subsidy.citizen_id)
      citizen.update_attribute(:elec_subsidy_id, id)
      flash[:success] = 'Succesfully registered for Electricity Subsidy'
      redirect_to citizen
    else
      render :new
    end
  end

  # PATCH/PUT /elec_subsidies/1
  def update
    if @elec_subsidy.update(elec_subsidy_params)
      flash[:success] = 'Succesfully updated subsidy subscription'
      redirect_to @elec_subsidy
    else
      render :edit
    end
  end

  # DELETE /elec_subsidies/1
  def destroy
    id = @elec_subsidy.id
    citizen = Citizen.find(@elec_subsidy.citizen_id)
    citizen.update_attribute(:elec_subsidy_id, nil)
    ActiveRecord::Base.connection.query("
      DELETE FROM elec_subsidies WHERE id = #{id}
    ")
    flash[:success] = 'Succesfully unregistered from Electricity subsidy'
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
    def set_elec_subsidy
      @elec_subsidy = ElecSubsidy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elec_subsidy_params
      params.require(:elec_subsidy).permit(:citizen_id)
    end
end
