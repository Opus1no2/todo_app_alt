FactoryBot.define do
  factory :todo_list do
    label { "Personal" }

    trait :with_todos do
      after :create do |todo_list|
        create_list(:todo, 2, todo_list: todo_list)
      end
    end
  end
end
