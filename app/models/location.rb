class Location < ApplicationRecord
  belongs_to :account
  has_many :service_records, dependent: :destroy

  validates :name, :address, :city, :postal_code, :cleaning_frequency, presence: true
end

