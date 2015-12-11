get '/users' do
  # list users
  erb :'users/index'
end

get '/users/new' do
  # form for user
  erb :'users/new'
end

post '/users' do
  # new user
  @user = User.new(params[:user])

  if @user.save && params[:user["password"]] != ""
    session[:user_id] = @user.id
    redirect '/'
  else
    flash[:error] = "Didn't work.  Try again."
    redirect "/users/new"
  end
  # redirect "/users/#{@user.id}"
end

get '/users/:id' do
  # specific user should only work if you login
  redirect '/users' unless current_user && authorized?
  @user = User.find(current_user.id)
  erb :"/users/show"
end

get '/users/:id/edit' do
  # edit form
  erb :"/users/edit"
end

put 'users/:id' do
  # update user
  redirect "/users/#{params[:id]}"
end

delete 'users/:id' do
  # delete user
  redirect '/users'
end
