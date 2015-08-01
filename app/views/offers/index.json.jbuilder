json.array!(@offers) do |offer|
  json.extract! offer, :id, :description, :price, :user_id, :listing_id
  json.url offer_url(offer, format: :json)
end
