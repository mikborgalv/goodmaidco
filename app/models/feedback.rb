class Feedback < ApplicationRecord
  belongs_to :service_record
  belongs_to :user
end
