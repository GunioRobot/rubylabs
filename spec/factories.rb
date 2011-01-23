# By using the symbol ':user', we get Factory Girl to simulate the
# user model



Factory.define :user do |user|
  user.name "Example User"
  user.email "user@example.de"
  # user.password "foobar"
  # user.password_confirmation "foobar"
end

# Factory.sequence :email do |n|
#   "person-#{n}@jlabs.de"
# end

Factory.define :post do |post|
  post.title "Test Title"
  post.content "Foo bar"
end

Factory.define :category do |category|
  category.name "Test Category"
  category.association :post
end
