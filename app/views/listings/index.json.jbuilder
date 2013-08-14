json.array!(@listings) do |listing|
  json.extract! listing, :title, :description
  json.url listing_url(listing, format: :json)
end
