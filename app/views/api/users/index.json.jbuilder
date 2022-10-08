json.array! @users do |user|
  json.partial! 'user', user: user

  json.comments do
    json.array! user.comments do |comment|
      json.partial! 'api/comments/comment', comment: comment
    end
    # json.partial! 'shared/comment', user: @user
  end

  json.created_at user.created_at
end

# json.comment do
#   json.partial! 'shared/comment', user: @user
# end
