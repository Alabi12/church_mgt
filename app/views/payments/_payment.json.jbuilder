json.extract! payment, :id, :amount, :member_id, :payment_method, :created_at, :updated_at
json.url payment_url(payment, format: :json)
