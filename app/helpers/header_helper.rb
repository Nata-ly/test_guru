module HeaderHelper
  def authentication_message(current_user)
    if loggen_in?
      content_tag(:p, t('header.message.logged_in', user: current_user.username)) +
      link_to(t('header.message.login_exit'), logout_path, method: :delete)
    else
      link_to t('header.message.not_logged_in'), login_path
    end
  end
end
