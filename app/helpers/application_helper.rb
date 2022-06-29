module ApplicationHelper
  def flash_message
    flash.map do |key, msg|
      content_tag :p, msg, :class => "flash #{key}"
    end.join()
  end
end
