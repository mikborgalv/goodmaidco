class Location < ApplicationRecord
  belongs_to :account
  has_many :service_records, dependent: :destroy

  validates :name, :address, :city, :postal_code, :cleaning_frequency, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["account_id", "address", "city", "cleaning_frequency", "created_at", "id", "name", "postal_code", "updated_at"]
  end

end

