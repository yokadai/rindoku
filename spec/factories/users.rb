
FactoryBot.define do
  factory :user do
   name {Faker::Name.last_name}
   email {Faker::Internet.free_email}
   password {'abc000'}
   password_confirmation {password}
  end
end
