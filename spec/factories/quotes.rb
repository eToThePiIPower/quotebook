FactoryBot.define do
  factory :quote do
    user
    text 'MyText'
    source 'MyString'

    trait :invalid do
      text ''
      source ''
    end
  end
end
