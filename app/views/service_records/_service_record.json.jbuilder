json.extract! service_record, :id, :partner_id, :location_id, :date, :status, :created_at, :updated_at
json.url service_record_url(service_record, format: :json)
