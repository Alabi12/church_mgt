class GenerationalsController < ApplicationController
  before_action :set_generational, only: %i[ show edit update destroy ]

  # GET /generationals or /generationals.json
  def index
    @generationals = Generational.all
    @cs_groups = CS.all
  end

  # GET /generationals/1 or /generationals/1.json
  def show
  end

  # GET /generationals/new
  def new
    @generational = Generational.new
  end

  # GET /generationals/1/edit
  def edit
  end

  # POST /generationals or /generationals.json
  def create
    @generational = Generational.new(generational_params)

    respond_to do |format|
      if @generational.save
        format.html { redirect_to generational_url(@generational), notice: "Generational was successfully created." }
        format.json { render :show, status: :created, location: @generational }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @generational.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generationals/1 or /generationals/1.json
  def update
    respond_to do |format|
      if @generational.update(generational_params)
        format.html { redirect_to generational_url(@generational), notice: "Generational was successfully updated." }
        format.json { render :show, status: :ok, location: @generational }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @generational.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generationals/1 or /generationals/1.json
  def destroy
    @generational.destroy!

    respond_to do |format|
      format.html { redirect_to generationals_url, notice: "Generational was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generational
      @generational = Generational.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def generational_params
      params.require(:generational).permit(:name)
    end
end
