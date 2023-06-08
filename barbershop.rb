require 'sinatra'
get '/' do
  erb :index
end

post '/' do
  @user_name = params[:user_name]
  @phone = params[:phone]
  @date_time = params[:date_time]

  @title = 'Thank you!'
  @message = "Dear, #{@user_name} we`ll waiting for you at #{@date_time}"

  f = File.open 'users.txt', 'a'
  f.write "User: #{@user_name}, Phone: #{@phone}, Date_time: #{@date_time}"
  f.close

  erb :message
end

get '/admin' do
  erb :admin
end

post '/admin' do
  @login = params[:login]
  @password = params[:password]

  if @login == "Admin" && @password == "Secret"
    @file = File.open("./users.txt","r")
    erb :result
  else
    @report = 'Access denied'
    erb :admin
  end
end

get '/about' do
  erb :about
end

get '/contacts' do
  erb :contacts
end

get '/visit' do
  erb :visit
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello'
  end
end
