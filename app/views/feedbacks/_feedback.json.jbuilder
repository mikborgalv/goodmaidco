json.extract! feedback, :id, :service_record_id, :user_id, :content, :rating, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
