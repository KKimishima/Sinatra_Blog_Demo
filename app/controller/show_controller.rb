class ShowController < AppController
  get "/:id" do
    @post = Posts.find(params['id'])
    erb :show_post
  end
end