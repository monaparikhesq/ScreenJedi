User.destroy_all
Tag.destroy_all
Screencast.destroy_all
Tagging.destroy_all
Subscription.destroy_all
Note.destroy_all
Rating.destroy_all


puts "Creating users."
100.times do |i|
  User.create(:email => "user#{i}@gmail.com", 
              :first_name => "First#{i}", 
              :last_name => "Last#{i}",
              :password => "test",
              :password_confirmation => "test")
end

puts "Creating tags."
tags = ["shortcuts", "word", "excel"]
tags.each do |tag|
  Tag.create :keyword => tag
end

puts "Creating screencasts."
100.times do |i|
  Screencast.create(:title => "Screencast #{i}", 
                    :description => "Lorem Ipsum #{i}", 
                    :length => rand(360), 
                    :embed => "http://www.youtube.com/watch?v=sdyC1BrQd6g")
end

taglist = Tag.all
puts "Creating taggings."
Screencast.all.each do |screencast|
  taglist.sample(2).each do |tag|
    Tagging.create(:screencast_id => screencast.id, 
                   :tag_id => tag.id)
  end
end

puts "Creating ratings."
ratings = ["awesome", "not so awesome"]
screencasts = Screencast.all
User.all.each do |user|
  screencasts.sample(rand(5)).each do |screencast|
    Rating.create :screencast_id => screencast.id,
                  :user_id => user.id,
                  :opinion => ratings.sample
  end
end

puts "Creating notes."
notes = ["Lorem Ipsum"]
screencasts = Screencast.all
User.all.each do |user|
  screencasts.sample(rand(5)).each do |screencast|
    Note.create :screencast_id => screencast.id,
                :user_id => user.id,
                :body => notes.sample
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

puts "Creating companies."
100.times do |i|
  Company.create(:name => "Your Company Name")
end









