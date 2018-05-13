class PageController < AppController

  get "/:id" do
    # ページがマイナスにしないように
    if params[:id].to_i <= 0
      settings.current_page = 1
    else
      settings.current_page = params[:id].to_i
    end

    page_min = ((params[:id].to_i - 1) * settings.page_size)
    @post = Posts.order("id DESC").offset(page_min).limit(settings.page_size)

    @next_page = settings.current_page + 1
    @previous_page = settings.current_page - 1
    erb :index
  end
end