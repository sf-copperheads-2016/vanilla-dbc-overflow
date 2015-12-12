post '/questions/:id/votes' do
  @question = Question.find_by(id: params[:id])

  if Vote.where({post_id: @question.id, user_id: current_user.id}) == []
      @vote = Vote.create!(vote_value: params[:vote_value], user_id: current_user.id, post_id: @question.id)
      redirect '/questions'
    else
      redirect '/'
  end

end
