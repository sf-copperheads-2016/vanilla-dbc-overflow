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

# get 'questions/:id/answers/:id/edit' do
#   # edit form
#   erb :"/answers/edit"
# end

# put 'questions/:id/answers/:id' do
#   # update answer
#   redirect "/answers/#{params[:id]}"
# end

# delete 'questions/:id/answers/:id' do
#   # delete answer
#   redirect '/answers'
# end
