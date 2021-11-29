class DefIntegralComputationsController < ApplicationController
  before_action :set_def_integral_computation, only: %i[ show edit update destroy ]

  # GET /def_integral_computations or /def_integral_computations.json
  def index
    @def_integral_computations = DefIntegralComputation.all
  end

  # GET /def_integral_computations/1 or /def_integral_computations/1.json
  def show
  end

  # GET /def_integral_computations/new
  def new
    @def_integral_computation = DefIntegralComputation.new
  end

  # GET /def_integral_computations/1/edit
  def edit
  end

  # POST /def_integral_computations or /def_integral_computations.json
  def create
    @def_integral_computation = DefIntegralComputation.new(def_integral_computation_params)

    respond_to do |format|
      if @def_integral_computation.save
        format.html { redirect_to @def_integral_computation, notice: "Def integral computation was successfully created." }
        format.json { render :show, status: :created, location: @def_integral_computation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @def_integral_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /def_integral_computations/1 or /def_integral_computations/1.json
  def update
    respond_to do |format|
      if @def_integral_computation.update(def_integral_computation_params)
        format.html { redirect_to @def_integral_computation, notice: "Def integral computation was successfully updated." }
        format.json { render :show, status: :ok, location: @def_integral_computation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @def_integral_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /def_integral_computations/1 or /def_integral_computations/1.json
  def destroy
    @def_integral_computation.destroy
    respond_to do |format|
      format.html { redirect_to def_integral_computations_url, notice: "Def integral computation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_def_integral_computation
      @def_integral_computation = DefIntegralComputation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def def_integral_computation_params
      params.require(:def_integral_computation).permit(:lower_bound, :upper_bound, :expression, :result)
    end
end
