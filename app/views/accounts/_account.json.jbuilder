json.extract! account, :id, :name, :phone_number, :billing_address, :created_at, :updated_at
json.url account_url(account, format: :json)
