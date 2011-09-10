FactoryGirl.define do
  sequence :name do |n|
    "Record #{n}"
  end

  factory :user do
    username  'user'
    email     'user@email.com'
    password  'somepassword'
    password_confirmation 'somepassword'
  end

  factory :page do
    name      'My new page'
    published true
    content   'This is my super page'
    association :section
  end

  factory :section do
    name  { Factory.next :name }
  end

  factory :article do
    name    'First article'
    content 'This is my first article'
  end

  factory :setting do
    name 'new_setting'
    value 'new_value'
    description 'This is our new setting it rocks. :)'
  end
end
