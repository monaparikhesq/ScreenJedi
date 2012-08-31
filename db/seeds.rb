User.destroy_all
Tag.destroy_all
Screencast.destroy_all
Subscription.destroy_all
Note.destroy_all
Rating.destroy_all
Company.destroy_all
Membership.destroy_all


puts "Creating users."
25.times do |i|
  User.create(:email => "user#{i}@gmail.com", 
              :first_name => "First#{i}", 
              :last_name => "Last#{i}",
              :password => "test",
              :password_confirmation => "test",
              :admin => false)
end

# puts "creating admin (user0@gmail.com)"
# # user0@gmail.com is an admin
# admin = User.first.admin = true
# admin.save

puts "Creating tags."
tags = ["shortcuts", "word", "excel"]
tags.each do |tag|
  Tag.create :keyword => tag
end

puts "Creating screencasts."
vids = ["http://www.youtube.com/watch?v=sdyC1BrQd6g", "http://www.youtube.com/watch?v=ZP7K9SycELA"]
50.times do |i|
  Screencast.create(:title => "Screencast #{i}", 
                    :description => "Lorem Ipsum #{i}", 
                    :length => rand(360), 
                    :embed => vids.sample)
end

taglist = Tag.all
puts "Creating taggings."
Screencast.all.each do |screencast|
  taglist.sample(2).each do |tag|
    Tagging.create(:screencast_id => screencast.id, 
                   :tag_id => tag.id)
  end
end



userlist = User.all
puts "Creating subscriptions."
Screencast.all.each do |screencast|
  userlist.sample(2).each do |user|
    Subscription.create(:screencast_id => screencast.id, 
                        :user_id => user.id)
  end
end

companies = ["ScreenJedi","InGen", "Cyberdyne", "Aperture Science", "Tyrell Corp"]
puts "Creating companies."
companies.each do |i|
  Company.create(:name => i)
end

co = Company.all
puts "Creating memberships"
userlist.each do |user|
  Membership.create(:company_id => co.sample.id,
                    :user_id => user.id)
end

puts "Adding companies to screencasts"
Screencast.all.each do |scast|
  scast.company_id = co.sample.id
  scast.save
end

puts "Creating ratings."
User.all.each do |user|
  user.company.screencasts.sample(rand(5)).each do |screencast|
    Rating.create :screencast_id => screencast.id,
                  :user_id => user.id,
                  :stars => rand(1..6)
  end
end

puts "Creating notes."
screencasts = Screencast.all
User.all.each do |user|
  user.company.screencasts.sample(rand(5)).each do |screencast|
    Note.create   :screencast_id => screencast.id,
                  :user_id => user.id,
                  :body => "Lorem Ipsum"
  end
end
  







