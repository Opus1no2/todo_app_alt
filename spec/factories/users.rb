FactoryBot.define do
  factory :user do
    email { "#{SecureRandom.uuid}@test.com"}
    password { SecureRandom.hex(10) }
  end
end
