json.extract! member, :id, :user_id, :first_name, :last_name, :gender, :date_of_birth, :contact_number, :address, :created_at, :updated_at
json.url member_url(member, format: :json)
