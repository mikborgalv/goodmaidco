class Feedback < ApplicationRecord
  belongs_to :service_record
  belongs_to :user

  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: 1..5 }
end

