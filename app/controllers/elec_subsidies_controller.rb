class ElecSubsidiesController < ApplicationController
  before_action :set_elec_subsidy, only: [:show, :edit, :update, :destroy]

  # GET /elec_subsidies
  # GET /elec_subsidies.json
  def index
    @elec_subsidies = ElecSubsidy.all
  end

  # GET /elec_subsidies/1
  # GET /elec_subsidies/1.json
  def show
  end

  # GET /elec_subsidies/new
  def new
    @elec_subsidy = ElecSubsidy.new
  end

  # GET /elec_subsidies/1/edit
  def edit
  end

  # POST /elec_subsidies
  # POST /elec_subsidies.json
  def create
    @elec_subsidy = ElecSubsidy.new(elec_subsidy_params)

    respond_to do |format|
      if @elec_subsidy.save
        format.html { redirect_to @elec_subsidy, notice: 'Elec subsidy was successfully created.' }
        format.json { render :show, status: :created, location: @elec_subsidy }
      else
        format.html { render :new }
        format.json { render json: @elec_subsidy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elec_subsidies/1
  # PATCH/PUT /elec_subsidies/1.json
  def update
    respond_to do |format|
      if @elec_subsidy.update(elec_subsidy_params)
        format.html { redirect_to @elec_subsidy, notice: 'Elec subsidy was successfully updated.' }
        format.json { render :show, status: :ok, location: @elec_subsidy }
      else
        format.html { render :edit }
        format.json { render json: @elec_subsidy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elec_subsidies/1
  # DELETE /elec_subsidies/1.json
  def destroy
    @elec_subsidy.destroy
    respond_to do |format|
      format.html { redirect_to elec_subsidies_url, notice: 'Elec subsidy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elec_subsidy
      @elec_subsidy = ElecSubsidy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def elec_subsidy_params
      params.require(:elec_subsidy).permit(:citizen_id)
    end
end
