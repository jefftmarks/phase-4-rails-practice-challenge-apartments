class ApartmentsController < ApplicationController

	def index
		render json: Apartment.all
	end

	def show
		apartment = find_apartment
		render json: apartment
	end

	def update
		apartment = find_apartment
		apartment.update(apartment_params)
		if apartment.valid?
			render json: apartment, status: :created
		else
			render json: { errors: apartment.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def create
		apartment = Apartment.create!(apartment_params)
		render json: apartment, status: :created
	end

	def destroy
		apartment = find_apartment
		apartment.destroy
		head :no_content
	end

	private

	def apartment_params
		params.permit(:number)
	end

	def find_apartment
		Apartment.find(params[:id])
	end
	
end
