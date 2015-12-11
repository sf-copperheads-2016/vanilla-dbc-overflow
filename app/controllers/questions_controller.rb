get '/questions' do
  # list questions
  p "GOT HERE"
  @questions = Question.all
  p @questions
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
  @question = Question.find(params[:id].to_i)
  @answers = @question.answers
  erb :"/questions/show"
end

post '/questions/:id' do
  if current_user && authorized?
    puts current_user
    puts current_user.id
    @new_answer = Answer.create!(body: params[:body],
                                 question_id: params[:id].to_i,
                                 user_id: current_user.id,)
  else
    puts "NOT OKAY"
  end
  redirect "/questions/#{params[:id]}"
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
  @question.destroy
  redirect '/questions'
end
