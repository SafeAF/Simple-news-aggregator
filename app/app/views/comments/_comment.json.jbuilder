json.extract! comment, :id, :post_id, :upvotes, :downvotes, :user_id, :body, :created_at, :updated_at
json.url comment_url(comment, format: :json)
