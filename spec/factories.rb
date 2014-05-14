FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@tonifreitag.de"}
    password "foobar"
    password_confirmation "foobar"

    factory :member do
      roles { [FactoryGirl.create(:role_member)]}
    end
    factory :admin do
      roles { [FactoryGirl.create(:role_admin)] }
    end
  end

  factory :role do
    name "Standardrolle"

    factory :role_admin do
      name "Admin"
      activities ["user:index", "user:show", "user:create", "user:update", "user:delete",
              "role:index", "role:show", "role:create", "role:update", "role:delete",
              "person:index", "person:show", "person:create", "person:update", "person:delete"]
    end
    factory :role_member do
      name "Mitglied"
      activities ["user:self"]
    end
  end
end