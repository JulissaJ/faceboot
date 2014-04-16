FactoryGirl.define do

  factory :post do
    content 'Today I learned all these cool things!'
  end

  factory :comment do
    body 'First!'
    post
  end

  factory :user do
    first_name 'Sterling'
    last_name 'Archer'
    sequence :username do |u|
      "blackturtleneck#{u}"
    end
    sequence :email do |e|
      "spy#{e}@isis.com"
    end
    password 'password'
    password_confirmation 'password'
  end


end
