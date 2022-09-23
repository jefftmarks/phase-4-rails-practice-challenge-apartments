class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
	rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessasble_entity_response

	private
	
	def render_record_not_found_response(exception)
		render json: { errors: "#{exception.model} not found" }, status: :not_found
	end

	def render_unprocessasble_entity_response(exception)
		render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
	end
end
