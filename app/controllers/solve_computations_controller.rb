class SolveComputationsController < ApplicationController
  before_action :set_solve_computation, only: %i[ show edit update destroy ]

  # GET /solve_computations or /solve_computations.json
  def index
    @solve_computations = SolveComputation.all
  end

  # GET /solve_computations/1 or /solve_computations/1.json
  def show
  end

  # GET /solve_computations/new
  def new
    @solve_computation = SolveComputation.new
  end

  # GET /solve_computations/1/edit
  def edit
  end

  # POST /solve_computations or /solve_computations.json
  def create
    @solve_computation = SolveComputation.new(solve_computation_params)

    respond_to do |format|
      if @solve_computation.save
        format.html { redirect_to @solve_computation, notice: "Solve computation was successfully created." }
        format.json { render :show, status: :created, location: @solve_computation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @solve_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solve_computations/1 or /solve_computations/1.json
  def update
    respond_to do |format|
      if @solve_computation.update(solve_computation_params)
        format.html { redirect_to @solve_computation, notice: "Solve computation was successfully updated." }
        format.json { render :show, status: :ok, location: @solve_computation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @solve_computation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solve_computations/1 or /solve_computations/1.json
  def destroy
    @solve_computation.destroy
    respond_to do |format|
      format.html { redirect_to solve_computations_url, notice: "Solve computation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solve_computation
      @solve_computation = SolveComputation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def solve_computation_params
      params.require(:solve_computation).permit(:left_hand, :right_hand, :result)
    end
end
