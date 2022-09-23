class TenantsController < ApplicationController

	def index
		render json: Tenant.all
	end

	def show
		tenant = find_tenant
		render json: tenant
	end

	def update
		tenant = find_tenant
		if tenant.update(tenant_params)
			render json: tenant, status: :created
		else
			render json: { errors: tenant.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def create
		tenant = Tenant.create!(tenant_params)
		render json: tenant, status: :created
	end

	def destroy
		tenant = find_tenant
		tenant.destroy
		head :no_content
	end

	private

	def tenant_params
		params.permit(:age, :name)
	end

	def find_tenant
		Tenant.find(params[:id])
	end

end
