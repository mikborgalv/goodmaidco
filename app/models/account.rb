class Account < ApplicationRecord
    has_many :locations, dependent: :destroy
  
    validates :name, :email, :phone_number, presence: true
    validates :email, uniqueness: true
  end
  