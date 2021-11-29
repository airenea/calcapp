class ZeroesComputationsController < ApplicationController
  before_action :set_zeroes_computation, only: %i[ show edit update destroy ]
  before_action :get_api

  # GET /zeroes_computations or /zeroes_computations.json
  def index
    @zeroes_computations = ZeroesComputation.all
  end

  # GET /zeroes_computations/1 or /zeroes_computations/1.json
  def show
  end

  # GET /zeroes_computations/new
  def new
    @zeroes_computation = ZeroesComputation.new
  end

  # GET /zeroes_computations/1/edit
  def edit
  end

  # POST /zeroes_computations or /zeroes_computations.json
  def create
    @zeroes_computation = ZeroesComputation.new(zeroes_computation_params)

    respond_to do |format|
      if @zeroes_computation.save
        format.html { redirect_to @zeroes_computation, notice: "Zeroes computation was successfully created." }
        format.json { render :show, status: :created, location: @zeroes_computation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @zeroes_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zeroes_computations/1 or /zeroes_computations/1.json
  def update
    respond_to do |format|
      if @zeroes_computation.update(zeroes_computation_params)
        format.html { redirect_to @zeroes_computation, notice: "Zeroes computation was successfully updated." }
        format.json { render :show, status: :ok, location: @zeroes_computation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @zeroes_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zeroes_computations/1 or /zeroes_computations/1.json
  def destroy
    @zeroes_computation.destroy
    respond_to do |format|
      format.html { redirect_to zeroes_computations_url, notice: "Zeroes computation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_api
    @client = NewtonAPI::V2::Client.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zeroes_computation
      @zeroes_computation = ZeroesComputation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def zeroes_computation_params
      params.require(:zeroes_computation).permit(:expression)
    end
end
