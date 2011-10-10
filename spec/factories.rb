FactoryGirl.define do
  sequence :name do |n|
    "Record #{n}"
  end

  sequence :email do |n|
    "user#{n}@email.com"
  end

  factory :role do
    name 'admin'
  end

  factory :user do
    username  'user'
    email     { Factory.next :email }
    password  'password'
    password_confirmation 'password'
  end

  factory :admin, :parent => :user do
    username  'admin'
    email     'admin@email.com'
    roles [ Factory.create( :role ) ]
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

  factory :setting do
    name 'new_setting'
    value 'new_value'
    description 'This is our new setting it rocks. :)'
  end
end
