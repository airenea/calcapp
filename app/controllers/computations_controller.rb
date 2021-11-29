class ComputationsController < ApplicationController
  before_action :set_computation, only: %i[ show edit update destroy ]
  before_action :get_api

  # GET /computations or /computations.json
  def index
    @computations = Computation.all
  end

  # GET /computations/1 or /computations/1.json
  def show
  end
 
  # GET /computations/new
  def new
    @computation = Computation.new
  end

  # GET /computations/1/edit
  def edit
  end

  # POST /computations or /computations.json
  def create
    @computation = Computation.new(computation_params)
    @computation.result = @client.compute(computation_params[:function], computation_params[:expression])["result"]
    respond_to do |format|
      if @computation.save
        format.html { redirect_to @computation, notice: "Computation was successfully created." }
        format.json { render :show, status: :created, location: @computation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computations/1 or /computations/1.json
  def update
    @computation.result = @client.compute(computation_params[:function], computation_params[:expression])["result"]
    respond_to do |format|
      if @computation.update(computation_params)
        format.html { redirect_to @computation, notice: "Computation was successfully updated." }
        format.json { render :show, status: :ok, location: @computation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computations/1 or /computations/1.json
  def destroy
    @computation.destroy
    respond_to do |format|
      format.html { redirect_to computations_url, notice: "Computation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_api
    @client = NewtonAPI::V2::Client.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_computation
      @computation = Computation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def computation_params
      params.require(:computation).permit(:function, :expression)
    end
end
