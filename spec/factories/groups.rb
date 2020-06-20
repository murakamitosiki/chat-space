
FactoryBot.define do
  factory :group do 
    name {Faker::Team.name}#Faker(偽物)がカラムの中身を生成してくれる
  end
end