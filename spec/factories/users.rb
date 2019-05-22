FactoryBot.define do
   factory :user do
    email {"tester@test.com"}
    password {"123456"}
    password_confirmation {"123456"}
  end
end