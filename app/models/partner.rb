class Partner < ApplicationRecord
    belongs_to :user
    has_many :service_records, dependent: :destroy
    validates :name, :phone_number, presence: true


  def self.ransackable_associations(auth_object = nil)
    ["service_records", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "phone_number", "rating", "updated_at"]
  end

  end
  