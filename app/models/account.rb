class Account < ApplicationRecord
    belongs_to :user
    has_many :locations, dependent: :destroy
    validates :name, :phone_number, presence: true

    def self.ransackable_associations(auth_object = nil)
      ["locations","user"]
    end
    def self.ransackable_attributes(auth_object = nil)
      ["billing_address", "created_at", "id", "name", "phone_number", "updated_at", "user_id"]
    end
  end
  