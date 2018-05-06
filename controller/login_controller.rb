class LoginController < AppController

  get "/" do
    erb :login
  end

  post "/" do
    user = Users.find_by(user: params[:user],pass: params[:pass])
    if user
      session[:user] = user.user
      redirect "/"
    else
      session.clear
      redirect "/login"
    end
  end

  get "/out" do
    session.clear
    redirect "/"
  end

  get "/change" do
    erb :login_change
  end

  post "/change" do
    session.clear
    user = Users.find_by(user: params[:user], pass: params[:old_pass])
    if user
      p user.user
      chane_pass = Users.find_by(user: params[:user])
      chane_pass.pass = params[:new_pass]
      chane_pass.save
      redirect '/'
    else
      erb :login_change
    end
  end

end