class Feedback < ApplicationRecord
  belongs_to :service_record
  belongs_to :user

  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }

  def self.ransackable_attributes(auth_object = nil)
    ["content", "created_at", "id", "rating", "service_record_id", "updated_at", "user_id"]
  end
end

