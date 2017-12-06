class CrasController < ApplicationController
  before_action :set_cra, only: [:show, :edit, :update, :destroy]

  # GET /cras
  # GET /cras.json
  def index
    @cras = Cra.all
  end

  # GET /cras/1
  # GET /cras/1.json
  def show
  end

  # GET /cras/new
  def new
    @cra = Cra.new
  end

  # GET /cras/1/edit
  def edit
  end

  # POST /cras
  # POST /cras.json
  def create
    @cra = Cra.new(cra_params)

    respond_to do |format|
      if @cra.save
        format.html { redirect_to @cra, notice: 'Cra was successfully created.' }
        format.json { render :show, status: :created, location: @cra }
      else
        format.html { render :new }
        format.json { render json: @cra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cras/1
  # PATCH/PUT /cras/1.json
  def update
    respond_to do |format|
      if @cra.update(cra_params)
        format.html { redirect_to @cra, notice: 'Cra was successfully updated.' }
        format.json { render :show, status: :ok, location: @cra }
      else
        format.html { render :edit }
        format.json { render json: @cra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cras/1
  # DELETE /cras/1.json
  def destroy
    @cra.destroy
    respond_to do |format|
      format.html { redirect_to cras_url, notice: 'Cra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cra
      @cra = Cra.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cra_params
      params.require(:cra).permit(:urlad, :words)
    end
end
