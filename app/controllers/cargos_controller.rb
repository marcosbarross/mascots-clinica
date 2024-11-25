class CargosController < ApplicationController
    before_action :set_cargo, only: %i[ show update destroy ]
    skip_before_action :verify_authenticity_token

    def index
        @cargos = Cargo.all
        render json: @cargos
    end

    def show
        render json: @cargo
    end

    def create
        @cargo = Cargo.new(cargo_params)
        if @cargo.save
            render json: @cargo, status: :created, location: @cargo
        else
            render json: @cargo.errors, status: :unprocessable_entity
        end
    end

    def update
        if @cargo.update(cargo_params)
            render json: @cargo
        else
            render json: @cargo.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @cargo.destroy
        head :no_content
    end

    private

    def set_cargo
        @cargo = Cargo.find(params[:id])
    end

    def cargo_params
        params.require(:cargo).permit(:nome_cargo, :description)
    end
end
