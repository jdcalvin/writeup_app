json.array!(@contents) do |content|
  json.extract! content, :code, :cat, :desc, :context
  json.url content_url(content, format: :json)
end