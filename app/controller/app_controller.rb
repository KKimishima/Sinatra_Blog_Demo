class AppController < Sinatra::Base
  # フォルダ設定
  set :views => File.expand_path("../views",File.dirname(__FILE__))
  set :public_folder => File.expand_path("../../public",File.dirname(__FILE__))
  # ヘルパー設定
  helpers AppHelper

  # 開発時のオートリロード有効
  configure :development do
    register Sinatra::Reloader
  end

  # ページの表示数と表示ページ設定
  configure do
    # セッション機能オン
    enable :sessions
    set :page_size => 5
    set :current_page => 1
    # set :login_user => nil
  end

  not_found do
    "ヒットなし"
  end
  error do
    "エラー発生"
  end


  get "/" do
    # 初期化ページ
    settings.current_page = 1
    @post = Posts.order("id DESC").limit(settings.page_size)
    @next_page = 2
    @previous_page = 1
    erb :index
  end
end

