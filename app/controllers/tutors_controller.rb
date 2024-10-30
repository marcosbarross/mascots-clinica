class TutorsController < ApplicationController
  before_action :set_tutor, only: %i[show update destroy]
  skip_before_action :verify_authenticity_token  # Se necessário para desabilitar CSRF para testes via Postman

  # GET /tutors.json
  def index
    @tutors = Tutor.all
    render json: @tutors
  end

  # GET /tutors/1.json
  def show
    render json: @tutor
  end

  # POST /tutors.json
  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      render json: @tutor, status: :created, location: @tutor
    else
      render json: @tutor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tutors/1.json
  def update
    if @tutor.update(tutor_params)
      render json: @tutor, status: :ok
    else
      render json: @tutor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tutors/1.json
  def destroy
    @tutor.destroy
    head :no_content
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def tutor_params
    params.require(:tutor).permit(:nome, :endereco, :telefone, :email)
  end
end
