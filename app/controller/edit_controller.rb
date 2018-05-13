class EditController < AppController
  before "/*" do

    if(session[:user].nil?)
      redirect "/login"
    end
  end

  get "/" do
    erb :posts_new
  end

  post "/" do
    post = Posts.new
    post.title = params["title"]
    post.content = params["content"]
    post.save
    redirect '/'
  end

  get "/:id" do
    @edit = Posts.find(params['id'])
    erb :posts_edit
  end

  post "/:id" do
    edit = Posts.find(params['id'])
    edit.title = params['title']
    edit.content = params['content']
    edit.save
    redirect '/'
  end

  get "/delete/:id" do
    Posts.find(params['id']).destroy
    redirect '/'
  end

end