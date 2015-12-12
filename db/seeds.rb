20.times do
  User.create!(name: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password: '1234',)
end

100.times do
  Post.create!(title: Faker::Lorem.word,
               body: Faker::Lorem.paragraph,
               type: 'Question',
               user_id: rand(1..20),)
end

400.times do
  Post.create!(body: Faker::Lorem.sentence,
               type: 'Answer',
               user_id: rand(1..20),
               question_id: rand(1..30),)
end

# lastly = Answer.last
# lastly.best_answer = true
# lastly.save

300.times do
  Post.create!(body: Faker::Lorem.sentence,
               type: 'Comment',
               user_id: rand(1..20),
               answer_id: rand(31..60),)
end

# ------------------------------------------
# 50.times do
#     User.create!(name: Faker::Internet.user_name,
#                email: Faker::Internet.email,
#                password: '1234',)
# end

# 100.times do
#   Post.create!(title: Faker::Hacker.say_something_smart,
#                body: Faker::Hacker.say_something_smart,
#                type: 'Question',
#                user_id: rand(1..50),)
# end

# 200.times do
#   Post.create!(body: Faker::Hacker.say_something_smart,
#                type: 'Answer',
#                user_id: rand(1..50),
#                question_id: rand(1..100),)
# end

# 500.times do
#   Post.create!(body: Faker::Hacker.say_something_smart,
#                type: 'Comment',
#                user_id: rand(1..50),
#                answer_id: rand(201..300),)
# end