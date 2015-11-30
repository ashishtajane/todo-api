json.array!(@items) do |item|
  json.extract! item, :id, :text, :done
  json.url item_url(item, format: :json)
end
