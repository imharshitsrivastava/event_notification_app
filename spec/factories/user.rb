FactoryBot.define do
    factory :user do
      first_name { 'First' }
      last_name { 'Last' }
      email { 'test@gmail.com' }
      password { 'Test@123' }
    end
end
