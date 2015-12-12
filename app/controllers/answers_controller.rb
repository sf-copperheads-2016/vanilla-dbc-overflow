# OFFICALLY DEPRECATED AS OF 12/11/15 10:50 PDT

# # get '/answers' do
# #   # list answers
# #   erb :'answers/index'
# # end

# get 'questions/:id/answers/new' do
#   # form for answer
#   puts "WER ARE HEREERERE"
#   erb :'/questions/:id'
# end

# post 'questions/:id/answers' do
#   puts "I get here2"
#   # new answer
#   redirect "/questions/:id"
#   # redirect "/answers/#{@answer.id}"
# end

# # get '/answers/:id' do
# #   # specific answer should only work if you login
# #   erb :"/answers/show"
# # end

get '/questions/:question_id/answers/:id/edit' do
  # edit form
  @answer = Answer.find_by(id: params[:id])

  erb :"/answers/edit"
end

put '/questions/:question_id/answers/:id' do
  # update answer
  @answer = Answer.find_by(id: params[:id])
  @answer.update(body: params[:body])
  redirect "/questions/#{params[:question_id]}"
end

delete '/questions/:id/answers/:id' do
  # delete answer
  redirect '/answers'
end
