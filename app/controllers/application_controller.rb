class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :set_locale

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  def after_sign_in_path_for(resource)
    flash[:notice] = t('flash.message.after_create_flash', name: resource.first_name)
    resource.admin? ? admin_tests_path : root_path
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

end
