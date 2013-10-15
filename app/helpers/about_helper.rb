module AboutHelper
  def team_maybe_link(first_name, last_name, &block)
    content = capture(&block)

    user = User.where(first_name: first_name, last_name: last_name).first

    if user
      link_to content, user_path(user)
    else
      content
    end
  end
end