json.extract! event, :id, :title, :description, :start_date, :end_date, :user_id, :book_id, :created_at, :updated_at
json.url event_url(event, format: :json)
