FactoryBot.define do
  factory :movie do
    title {Faker::Movie.title}
    user_id {Random.rand(10..100)}
    description {Faker::Company.bs}
    like {Random.rand(10..100)}
    dislike {Random.rand(10..100)}
    url {"https://www.youtube.com/watch?v=s0XFX3WHg0w&ab_channel=BeABetterDev"}
  end
end
