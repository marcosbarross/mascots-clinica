class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[ show update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /animals or /animals.json
  def index
    @animals = Animal.all
    render json: @animals
  end

  # GET /animals/1 or /animals/1.json
  def show
    render json: @animal
  end

  # POST /animals or /animals.json
  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      render json: @animal, status: :created, location: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animals/1 or /animals/1.json
  def update
    if @animal.update(animal_params)
      render json: @animal, status: :ok, location: @animal
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animals/1 or /animals/1.json
  def destroy
    @animal.destroy!
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_animal
    @animal = Animal.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def animal_params
    params.require(:animal).permit(:nome, :idade, :especie, :raca, :peso, :tutor_id)
  end
end