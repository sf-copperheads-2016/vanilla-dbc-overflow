# get '/sessions' do
#   # list sessions
#   erb :'sessions/index'
# end

get '/sessions/new' do
  # form for session
  erb :'sessions/new'

end

post '/sessions' do
  # new session
  # log in
  @user = User.find_by(email: params[:email])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:error] = "Incorrect name or password"
      redirect '/sessions/new'
    end


  # redirect "/sessions/#{@session.id}"
end

# get '/sessions/:id' do
#   # specific session should only work if you login
#   erb :"/sessions/show"
# end

# get '/sessions/:id/edit' do
#   # edit form
#   erb :"/sessions/edit"
# end

# put 'sessions/:id' do
#   # update session
#   redirect "/sessions/#{params[:id]}"
# end

delete '/sessions' do
  # delete session
  session[:user_id] = nil
  current_user = nil
  redirect '/'
end
