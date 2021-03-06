FactoryGirl.define do
  factory :user, :class => Honeybadger::Api::User do
    name "Tom Smith"
    email "tom.smith@example.com"

    initialize_with do
      new(name, email)
    end
  end
end