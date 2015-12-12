20.times do
  User.create!(name: Faker::Name.first_name,
               email: Faker::Internet.email,
               password: '1234',)
end

30.times do
  Post.create!(title: Faker::Lorem.word,
               body: Faker::Lorem.paragraph,
               type: 'Question',
               user_id: rand(1..20),)
end

30.times do
  Post.create!(body: Faker::Lorem.sentence,
               type: 'Answer',
               user_id: rand(1..20),
               question_id: rand(1..30),)
end

lastly = Answer.last
lastly.best_answer = true
lastly.save

30.times do
  Post.create!(body: Faker::Lorem.sentence,
               type: 'Comment',
               user_id: rand(1..20),
               answer_id: rand(31..60),)
end
