class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    flash[:notice] = t('flash.message.after_create_flash', name: resource.first_name)
    resource.admin? ? admin_tests_path : root_path
  end

end
