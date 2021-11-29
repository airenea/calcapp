class LogComputationsController < ApplicationController
  before_action :set_log_computation, only: %i[ show edit update destroy ]
  before_action :get_api

  # GET /log_computations or /log_computations.json
  def index
    @log_computations = LogComputation.all
  end

  # GET /log_computations/1 or /log_computations/1.json
  def show
  end

  # GET /log_computations/new
  def new
    @log_computation = LogComputation.new
  end

  # GET /log_computations/1/edit
  def edit
  end

  # POST /log_computations or /log_computations.json
  def create
    @log_computation = LogComputation.new(log_computation_params)
    @log_computation.result = @client.log(log_computation_params[:base], log_computation_params[:number])["result"][0 .. 15].to_d

    respond_to do |format|
      if @log_computation.save
        format.html { redirect_to @log_computation, notice: "Log computation was successfully created." }
        format.json { render :show, status: :created, location: @log_computation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @log_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /log_computations/1 or /log_computations/1.json
  def update
    @log_computation.result = @client.log(log_computation_params[:base], log_computation_params[:number])["result"][0 .. 15].to_d
    respond_to do |format|
      if @log_computation.update(log_computation_params)
        format.html { redirect_to @log_computation, notice: "Log computation was successfully updated." }
        format.json { render :show, status: :ok, location: @log_computation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @log_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_computations/1 or /log_computations/1.json
  def destroy
    @log_computation.destroy
    respond_to do |format|
      format.html { redirect_to log_computations_url, notice: "Log computation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_api
    @client = NewtonAPI::V2::Client.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_computation
      @log_computation = LogComputation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def log_computation_params
      params.require(:log_computation).permit(:base, :number)
    end
end
