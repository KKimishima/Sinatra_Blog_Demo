class ArchiveController < AppController
  get "/:date" do
    # 初期化ページ
    settings.current_page = 1

    date = Time.parse params[:date]

    @post = Posts.where(created_at: (date)..(date.next_month)).order("id DESC").limit(settings.page_size)
    @archive_math = date.strftime("%Y年%m月")
    @date = params[:date]
    @next_page = 2
    @previous_page = 1
    erb :archive
  end

  get "/:date/page/:id" do
    if params[:id].to_i <= 0
      settings.current_page = 1
    else
      settings.current_page = params[:id].to_i
    end

    date = Time.parse params[:date]

    page_min = ((params[:id].to_i - 1) * settings.page_size)

    @post = Posts.where(created_at: (date)..(date.next_month)).order("id DESC").offset(page_min).limit(settings.page_size)
    @date = params[:date]
    @archive_math = date.strftime("%Y年%m月")
    @next_page = settings.current_page + 1
    @previous_page = settings.current_page - 1
    erb :archive
  end
end