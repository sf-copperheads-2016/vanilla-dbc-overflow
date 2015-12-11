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
  redirect "/answers"
  # redirect "/answers/#{@answer.id}"
end

get '/answers/:id' do
  # specific answer should only work if you login
  erb :"/answers/show"
end

get '/answers/:id/edit' do
  # edit form
  erb :"/answers/edit"
end

put 'answers/:id' do
  # update answer
  redirect "/answers/#{params[:id]}"
end

delete 'answers/:id' do
  # delete answer
  redirect '/answers'
end
