module ApplicationHelper
  def format_date(date)
    date.strftime("%b %d, %Y %l:%M %P %Z")
  end
end
