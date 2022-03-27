json.extract! expense, :id, :description, :amount, :current_sales_person_name, :created_at, :updated_at
json.url expense_url(expense, format: :json)
