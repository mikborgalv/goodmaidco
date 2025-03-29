class Partner < ApplicationRecord
    belongs_to :user

    ROLES = %w[client provider].freeze
    validates :role, inclusion: { in: ROLES }
    validates :user_id, uniqueness: { scope: :role, 
      message: "can only have one partner per role type" }

    has_many :service_records, dependent: :destroy
    validates :name, :phone_number, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["service_records", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "phone_number", "rating", "role", "updated_at"]
  end

  end
  