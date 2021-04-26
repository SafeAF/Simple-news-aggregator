json.extract! post, :id, :user_id, :url, :upvotes, :headline, :body, :argument, :created_at, :updated_at
json.url post_url(post, format: :json)
