
get '/questions' do
  # list questions
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
                           body: params[:body],
                           user_id: current_user.id,)
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    flash[:error] = "Question did not save.  Please validate something."
    redirect '/questions/new'
  end
  # redirect "/questions"
end

get '/questions/:id' do
  # specific question
  @question = Question.find(params[:id].to_i)
  @answers = @question.answers
  @q_comments = Comment.where(question_id: params[:id].to_i)
  erb :"/questions/show"
end

post '/questions/:id' do
  if current_user
    @new_answer = Answer.create!(body: params[:body],
                                 question_id: params[:id].to_i,
                                 user_id: current_user.id,)
    if request.xhr?
      return @new_answer.to_json
    else
      redirect "/questions/#{params[:id]}"
    end
  end
  redirect "/questions/#{params[:id]}"
end

post '/questions/:id/q_comment' do
  if current_user
    @new_q_comment = Comment.create!(body: params[:comment],
                                     question_id: params[:question_id],
                                     user_id: current_user.id,)
    if request.xhr?
      return @new_q_comment.to_json
    else
      redirect "/questions/#{params[:id]}"
    end
  end
  redirect "/questions/#{params[:id]}"
end

post '/questions/:id/a_comment' do
  if current_user
    @new_a_comment = Comment.create!(body: params[:comment],
                                     answer_id: params[:answer_id],
                                     user_id: current_user.id,)
  end
  redirect "/questions/#{params[:id]}"
end

put '/questions/:id/best_answer' do
  # best answer button
  if request.xhr?
    puts params.inspect
    @answer = Answer.find(params[:toggle_best].to_i)
    @answer.update_attributes(best_answer: true)
    @answer.save
    @answer.to_json
  else
    redirect "/questions/#{params[:id]}"
  end
end

get '/questions/:id/edit' do
  # edit form
  @question = Question.find(params[:id])
  @user_id = @question.user_id
  if current_user && current_user.id == @user_id#current user's id matches the Question's user_id
    erb :"/questions/edit"
  else
    #error message
    redirect '/questions'
  end
end

put '/questions/:id' do
  # update question
  @question = Question.find_by(id: params[:id])
  @question.update(title: params[:title], body: params[:body])
  redirect "/questions/#{params[:id]}"
end

delete '/questions/:id' do
  # delete question
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect '/questions'
end
