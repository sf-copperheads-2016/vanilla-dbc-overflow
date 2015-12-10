get '/sessions' do
  # list sessions
  erb :'sessions/index'
end

get '/sessions/new' do
  # form for session
  erb :'sessions/new'
end

post '/sessions' do
  # new session
  redirect "/sessions"
  # redirect "/sessions/#{@session.id}"
end

get '/sessions/:id' do
  # specific session should only work if you login
  erb :"/sessions/show"
end

get '/sessions/:id/edit' do
  # edit form
  erb :"/sessions/edit"
end

put 'sessions/:id' do
  # update session
  redirect "/sessions/#{params[:id]}"
end

delete 'sessions/:id' do
  # delete session
  redirect '/sessions'
end
