json.posts @posts do |post|
  json.title post.title
  json.count post.comments.count
end