module AppHelper

  def blog_time(time)
    time.strftime("%Y年%m月%d日 %H:%M:%S")
  end
  def cut_long_contents(contents)
    max_str = 200
    if(contents.size >= max_str)
      contents.slice(0..max_str) + "..."
    else
      contents
    end
  end
  def link_edit_to(url_action)
    %Q[/edit/#{url_action}]
  end
  def link_page_to(url_action)
    %Q[/page/#{url_action}]
  end
  def link_show_to(url_action)
    %Q[/show/#{url_action}]
  end
  def link_app_to(url_action)
    %Q[/#{url_action}]
  end
  def link_login_to(url_action)
    %Q[/login/#{url_action}]
  end
  def link_archive_to(url_action)
    %Q[/archive/#{url_action}]
  end

end