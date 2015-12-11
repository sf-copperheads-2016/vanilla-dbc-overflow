# get '/answers' do
#   # list answers
#   erb :'answers/index'
# end

# get '/answers/new' do
#   # form for answer
#   erb :'answers/new'
# end

post 'questions/:id/answers/new' do
  # new answer
  redirect "/questions/:id/answers"
  # redirect "/answers/#{@answer.id}"
end

# get '/answers/:id' do
#   # specific answer should only work if you login
#   erb :"/answers/show"
# end

get 'questions/:id/answers/:id/edit' do
  # edit form
  erb :"/answers/edit"
end

put 'questions/:id/answers/:id' do
  # update answer
  redirect "/answers/#{params[:id]}"
end

delete 'questions/:id/answers/:id' do
  # delete answer
  redirect '/answers'
end
