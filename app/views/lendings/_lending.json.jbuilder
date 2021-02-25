json.extract! lending, :id, :name, :lending_at, :expected_return_at, :lender_id, :borrower_id, :created_at, :updated_at
json.url lending_url(lending, format: :json)
