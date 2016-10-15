module UsersHelper
  def get_display_status u
    if(u.id_issued && u.forum_name) then
      return "primary"
    elsif(!u.id_issued && !u.forum_name) then
      return "danger"
    else
      return "warning"
    end
  end

  # some email field occasionally has multiple emails in it
  # this splits them out so they link properly
  def split_email u
    u.email && u.email.gsub(/\s+/m, ' ').strip.split(" ") || []
  end
end
