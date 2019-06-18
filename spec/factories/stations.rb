FactoryBot.define do
  factory :station do
    name { "MyString" }
    space { 1 }
    free_bikes { 1 }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
