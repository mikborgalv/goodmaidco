class ServiceRecord < ApplicationRecord
  belongs_to :partner
  belongs_to :location
end
