class RacersController < ApplicationController
  before_action :set_racer, only: %i[ show edit update destroy ]

  # GET /racers or /racers.json
  def index
    @racers = Racer.all

    render json: @racers
  end

  # GET /racers/1 or /racers/1.json
  def show
  end

  # GET /racers/new
  def new
    @racer = Racer.new
  end

  # GET /racers/1/edit
  def edit
  end

  # POST /racers or /racers.json
  def create
    @racer = Racer.new(racer_params)

    respond_to do |format|
      if @racer.save
        format.html { redirect_to @racer, notice: "Racer was successfully created." }
        format.json { render :show, status: :created, location: @racer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @racer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /racers/1 or /racers/1.json
  def update
    respond_to do |format|
      if @racer.update(racer_params)
        format.html { redirect_to @racer, notice: "Racer was successfully updated." }
        format.json { render :show, status: :ok, location: @racer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @racer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /racers/1 or /racers/1.json
  def destroy
    @racer.destroy
    respond_to do |format|
      format.html { redirect_to racers_url, notice: "Racer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_racer
      @racer = Racer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def racer_params
      params.require(:racer).permit(:f_name, :l_name, :city, :state, :lat, :lng)
    end
end
