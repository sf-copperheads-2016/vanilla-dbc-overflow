get '/questions' do
  # list questions
  erb :'questions/index'
end

get '/questions/new' do
  # form for question
  erb :'questions/new'
end

post '/questions' do
  # new question
  @question = Question.new(title: params[:title],
                           body: params[:body],)
  if @entry.save
    redirect "/questions/#{@question.id}"
  else
    # flash applicable error
  end
  # redirect "/questions"
end

get '/questions/:id' do
  # specific question
  erb :"/questions/show"
end

get '/questions/:id/edit' do
  # edit form
  @question = Question.find(:id)
  @user_id = @question.user_id
  if #current user's id matches the Question's user_id
    erb :"/questions/edit"
  else
    #error message
  end
end

put 'questions/:id' do
  # update question
  @question = Question.update(params[:entry])
  redirect "/questions/#{params[:id]}"
end

delete 'questions/:id' do
  # delete question
  redirect '/questions'
end
