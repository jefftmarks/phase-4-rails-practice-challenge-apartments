class Lease < ApplicationRecord
	belongs_to :apartment
	belongs_to :tenant

	validates :apartment_id, :tenant_id, presence: true
end
