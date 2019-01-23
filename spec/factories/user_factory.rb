FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "abc123"
    first_name "Peter"
    last_name "Example"
    admin false
  end


  factory :admin, class: User do
    email
    password "abc123"
    admin true
    first_name "Admin"
    last_name "User"
  end
end # Define all factories inside this block
# Add "class:..." whenever you create a factory that doesn't have the same name as a model.
# email is the same name as the sequence :email, FactoryBot automatically knows it should use the sequence to get a sample email address.
