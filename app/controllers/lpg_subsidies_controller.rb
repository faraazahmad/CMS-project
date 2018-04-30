class LpgSubsidiesController < ApplicationController
  before_action :set_lpg_subsidy, only: [:show, :edit, :update, :destroy]
  before_action :admin_logged_in

  # GET /lpg_subsidies
  def index
    @lpg_subsidies = LpgSubsidy.all
  end

  # GET /lpg_subsidies/1
  def show
  end

  # GET /lpg_subsidies/new
  def new
    @lpg_subsidy = LpgSubsidy.new
  end

  # POST /lpg_subsidies
  def create
    @lpg_subsidy = LpgSubsidy.new(lpg_subsidy_params)

    if @lpg_subsidy.save
      id = @lpg_subsidy.id
      citizen = Citizen.find(@lpg_subsidy.citizen_id)
      citizen.update_attribute(:lpg_subsidy_id, id)
      flash[:success] = 'Succesfully registered for LPG Subsidy'
      redirect_to citizen
    else
      render :new
    end
  end

  # PATCH/PUT /lpg_subsidies/1
  def update
    if @lpg_subsidy.update(lpg_subsidy_params)
      flash[:success] = 'Succesfully updated subsidy subscription'
      redirect_to @lpg_subsidy
    else
      render :edit
    end
  end

  # DELETE /lpg_subsidies/1
  def destroy
    id = @lpg_subsidy.id
    citizen = Citizen.find(@lpg_subsidy.citizen_id)
    citizen.update_attribute(:lpg_subsidy_id, nil)
    ActiveRecord::Base.connection.query("
      DELETE FROM lpg_subsidies WHERE id = #{id}
    ")
    flash[:success] = 'Succesfully unregistered from LPG Subsidy'
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
    def set_lpg_subsidy
      @lpg_subsidy = LpgSubsidy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lpg_subsidy_params
      params.require(:lpg_subsidy).permit(:citizen_id)
    end
end
