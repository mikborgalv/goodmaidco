json.extract! location, :id, :account_id, :name, :address, :city, :postal_code, :cleaning_frequency, :created_at, :updated_at
json.url location_url(location, format: :json)
