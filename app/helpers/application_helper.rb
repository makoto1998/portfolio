module ApplicationHelper

  def page_title
    title = "皆の習慣化支援サイト" #これがサイトのブランド名
    title = @page_title + " | " + title if @page_title
    title
  end
end
