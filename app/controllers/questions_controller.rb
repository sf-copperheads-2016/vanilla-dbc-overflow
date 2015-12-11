
get '/questions' do
  # list questions
  p "GOT HERE"
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  # form for question
  if current_user
    erb :'questions/new'
  else
    redirect '/questions'
  end
end

post '/questions' do
  # new question
  @question = Question.new(title: params[:title],
                           body: params[:body], user_id: current_user.id)
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    # flash applicable error
  end
  # redirect "/questions"
end

get '/questions/:id' do
  # specific question
  @question = Question.find(params[:id].to_i)
  @answers = @question.answers
  erb :"/questions/show"
end

post '/questions/:id' do
    @new_answer = Answer.create!(body: params[:body],
                                 question_id: params[:id].to_i,
                                 user_id: current_user.id,)
  # else
  #   # flash applicable error
  # end
  redirect "/questions/#{params[:id]}"
end

get '/questions/:id/edit' do
  # edit form

  @question = Question.find(:id)
  @user_id = @question.user_id
  if current_user.id == @user_id#current user's id matches the Question's user_id
    erb :"/questions/edit"
  else
    #error message
    redirect '/questions'
  end
end

put 'questions/:id' do
  # update question
  @question = Question.update(params[:entry])
  redirect "/questions/#{params[:id]}"
end

delete 'questions/:id' do
  # delete question

  @question.destroy
  redirect '/questions'
end
