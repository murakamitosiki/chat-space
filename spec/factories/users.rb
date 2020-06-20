FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)#minなので最低8文字以上必要
    name {Faker::Name.last_name} #苗字だけの偽のカラムを生成
    email {Faker::Internet.free_email}
    password {password} #上で作ったpasswordが引数で作られ、spec.rbで使われる。
    password_confirmation {password}
  end
end