FactoryBot.define do#messageを勝手に作ってくれる工場
  factory :message do
    chat {Faker::Lorem.sentence}#適当な文章が生成される。
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}#failを開くrailsのルーティングのところを見ていくpublic/images/test_image.jpg"のディレクトリーから写真を引っ張ってくる。
    user#userid
    group#groupid
  end
end