FactoryGirl.define do

  factory :organization do |f|
    f.name {Forgery::Name.full_name}
    f.contact {Forgery::Internet.email_address}
    f.city {Forgery::Address.city}
    f.country {Forgery::Address.country}
    f.password {Forgery::Basic.password}
    f.email {Forgery::Internet.email_address}
    f.announcer {Forgery::Name.full_name}
  end

  factory :tag do |f|
    f.name {Forgery::Name.full_name}
  end

end
