class ServiceRecord < ApplicationRecord
  belongs_to :partner
  belongs_to :location
  has_one :feedback, dependent: :destroy

  validates :date, :status, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "id", "location_id", "partner_id", "status", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["feedbacks", "location", "partner"]
  end
end
