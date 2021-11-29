class TrigComputationsController < ApplicationController
  before_action :set_trig_computation, only: %i[ show edit update destroy ]
  before_action :get_api

  # GET /trig_computations or /trig_computations.json
  def index
    @trig_computations = TrigComputation.all
  end

  # GET /trig_computations/1 or /trig_computations/1.json
  def show
  end

  # GET /trig_computations/new
  def new
    @trig_computation = TrigComputation.new
  end

  # GET /trig_computations/1/edit
  def edit
  end

  # POST /trig_computations or /trig_computations.json

  def create
    @trig_computation = TrigComputation.new(trig_computation_params)
    if @trig_computation.radians == false 
      if @trig_computation.function == "sin" || @trig_computation.function == "cos" || @trig_computation.function == "tan"
      expression = trig_computation_params[:expression]
      @trig_computation.result = @client.trig(trig_computation_params[:function], (expression.to_i * Math::PI / 180).to_s)["result"]
      elsif @trig_computation.function == "arcsin" || @trig_computation.function == "arccos" || @trig_computation.function == "arctan"
        @trig_computation.result = (@client.compute("simplify",@client.trig(trig_computation_params[:function], trig_computation_params[:expression])["result"].gsub(" ","*").gsub("pi","3.14159265359"))["result"].to_f * 180 / Math::PI).to_s
      end
    elsif @trig_computation.radians == true 
      @trig_computation.result = @client.trig(trig_computation_params[:function], trig_computation_params[:expression])["result"]
    end
    respond_to do |format|
      if @trig_computation.save
        format.html { redirect_to @trig_computation, notice: "Trig computation was successfully created." }
        format.json { render :show, status: :created, location: @trig_computation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trig_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trig_computations/1 or /trig_computations/1.json
  def update
      if @trig_computation.radians == false 
        if @trig_computation.function == "sin" || @trig_computation.function == "cos" || @trig_computation.function == "tan"
        expression = trig_computation_params[:expression]
        @trig_computation.result = @client.trig(trig_computation_params[:function], (expression.to_i * Math::PI / 180).to_s)["result"]
        elsif @trig_computation.function == "arcsin" || @trig_computation.function == "arccos" || @trig_computation.function == "arctan"
          @trig_computation.result = (@client.compute("simplify",@client.trig(trig_computation_params[:function], trig_computation_params[:expression])["result"].gsub(" ","*").gsub("pi","3.14159265359"))["result"].to_f * 180 / Math::PI).to_s
        end
      elsif @trig_computation.radians == true 
        @trig_computation.result = @client.trig(trig_computation_params[:function], trig_computation_params[:expression])["result"]
      end
    respond_to do |format|
      if @trig_computation.update(trig_computation_params)
        format.html { redirect_to @trig_computation, notice: "Trig computation was successfully updated." }
        format.json { render :show, status: :ok, location: @trig_computation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trig_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trig_computations/1 or /trig_computations/1.json
  def destroy
    @trig_computation.destroy
    respond_to do |format|
      format.html { redirect_to trig_computations_url, notice: "Trig computation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_api
    @client = NewtonAPI::V2::Client.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trig_computation
      @trig_computation = TrigComputation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trig_computation_params
      params.require(:trig_computation).permit(:function, :expression, :radians)
    end
end
