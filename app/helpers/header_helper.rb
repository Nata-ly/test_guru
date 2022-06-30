module HeaderHelper
  def authentication_message(current_user)
    if user_signed_in?
      content_tag(:span, t('header.message.logged_in', user: current_user.email)) + " | " +
      link_to(t('header.message.login_exit'), destroy_user_session_path, method: :delete)
    else
      link_to t('header.message.not_logged_in'), user_session_path
    end
  end
end
