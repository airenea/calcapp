class TangentComputationsController < ApplicationController
  before_action :set_tangent_computation, only: %i[ show edit update destroy ]
  before_action :get_api

  # GET /tangent_computations or /tangent_computations.json
  def index
    @tangent_computations = TangentComputation.all
  end

  # GET /tangent_computations/1 or /tangent_computations/1.json
  def show
  end

  # GET /tangent_computations/new
  def new
    @tangent_computation = TangentComputation.new
  end

  # GET /tangent_computations/1/edit
  def edit
  end

  # POST /tangent_computations or /tangent_computations.json
  def create
    @tangent_computation = TangentComputation.new(tangent_computation_params)
    @tangent_computation.result = @client.tangent(tangent_computation_params[:point], tangent_computation_params[:expression])["result"]

    respond_to do |format|
      if @tangent_computation.save
        format.html { redirect_to @tangent_computation, notice: "Tangent computation was successfully created." }
        format.json { render :show, status: :created, location: @tangent_computation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tangent_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tangent_computations/1 or /tangent_computations/1.json
  def update
    @tangent_computation.result = @client.tangent(tangent_computation_params[:point], tangent_computation_params[:expression])["result"]
    respond_to do |format|
      if @tangent_computation.update(tangent_computation_params)
        format.html { redirect_to @tangent_computation, notice: "Tangent computation was successfully updated." }
        format.json { render :show, status: :ok, location: @tangent_computation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tangent_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tangent_computations/1 or /tangent_computations/1.json
  def destroy
    @tangent_computation.destroy
    respond_to do |format|
      format.html { redirect_to tangent_computations_url, notice: "Tangent computation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_api
    @client = NewtonAPI::V2::Client.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tangent_computation
      @tangent_computation = TangentComputation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tangent_computation_params
      params.require(:tangent_computation).permit(:point, :expression)
    end
end
