class ServiceRecord < ApplicationRecord
  belongs_to :partner
  belongs_to :location
  has_many :feedbacks, dependent: :destroy

  validates :date, :status, presence: true
end
