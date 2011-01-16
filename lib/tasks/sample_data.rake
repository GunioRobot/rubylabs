require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_posts
    # make_relationships
  end
end

def make_users
  99.times do |n|
    name = Faker::Name.name
    email = "fakemail-#{n+1}@rubylabs.de"
    User.create!( :name => name,
                  :email => email)
  end
end

def make_posts
  User.all(:limit => 6).each do |user|
    50.times do
      body = Faker::Lorem.sentences(5)
      title = Faker::Lorem.words(3)
      user.posts.create!(:title => title, :body => body)
  end
end
end
