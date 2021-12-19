FactoryBot.define do
  factory :todo do
    description { "wash dishes" }
    due_at { "2021-12-18 16:06:35" }
    complete_at { "2021-12-18 16:06:35" }
    todo_list
  end
end
