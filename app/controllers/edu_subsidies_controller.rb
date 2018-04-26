class EduSubsidiesController < ApplicationController
  before_action :set_edu_subsidy, only: [:show, :edit, :update, :destroy]

  # GET /edu_subsidies
  # GET /edu_subsidies.json
  def index
    @edu_subsidies = EduSubsidy.all
  end

  # GET /edu_subsidies/1
  # GET /edu_subsidies/1.json
  def show
  end

  # GET /edu_subsidies/new
  def new
    @edu_subsidy = EduSubsidy.new
  end

  # GET /edu_subsidies/1/edit
  def edit
  end

  # POST /edu_subsidies
  # POST /edu_subsidies.json
  def create
    @edu_subsidy = EduSubsidy.new(edu_subsidy_params)

    respond_to do |format|
      if @edu_subsidy.save
        format.html { redirect_to @edu_subsidy, notice: 'Edu subsidy was successfully created.' }
        format.json { render :show, status: :created, location: @edu_subsidy }
      else
        format.html { render :new }
        format.json { render json: @edu_subsidy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /edu_subsidies/1
  # PATCH/PUT /edu_subsidies/1.json
  def update
    respond_to do |format|
      if @edu_subsidy.update(edu_subsidy_params)
        format.html { redirect_to @edu_subsidy, notice: 'Edu subsidy was successfully updated.' }
        format.json { render :show, status: :ok, location: @edu_subsidy }
      else
        format.html { render :edit }
        format.json { render json: @edu_subsidy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /edu_subsidies/1
  # DELETE /edu_subsidies/1.json
  def destroy
    @edu_subsidy.destroy
    respond_to do |format|
      format.html { redirect_to edu_subsidies_url, notice: 'Edu subsidy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_edu_subsidy
      @edu_subsidy = EduSubsidy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def edu_subsidy_params
      params.require(:edu_subsidy).permit(:citizen_id)
    end
end
