desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  emails = ["example1@example.com", "example2@example.com", "example3@example.com", "example4@example.com", "example5@example.com"]

  10.times do |count|
    user = User.new
    user.first_name = Faker::Name.first_name
    user.last_name = Faker::Name.last_name
    user.email = emails.at(count)
    user.password = "password"
    user.save
  end

  users = User.all

  15.times do |count|
    post = Post.new
    post.body = Faker::Lorem.paragraph(sentence_count: 3)
    post.title = Faker::Lorem.paragraph
    post.user_id = users.sample.id
    post.save
  end

  posts = Post.all

  20.times do |count|
    comment = Comment.new
    comment.body = Faker::Lorem.paragraph(sentence_count: 1)
    comment.user_id = users.sample.id
    comment.post_id = posts.sample.id
    comment.save
  end
end
