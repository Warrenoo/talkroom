module ApplicationHelper
  def time_format(time)
    time.strftime("%Y年%m月%d日 %H:%M:%S")
  end
end
