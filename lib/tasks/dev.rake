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



  
end
