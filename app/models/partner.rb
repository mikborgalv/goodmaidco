class Partner < ApplicationRecord
    has_many :service_records, dependent: :destroy
  
    validates :name, :email, :phone_number, presence: true
    validates :email, uniqueness: true
  end
  