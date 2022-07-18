class ContactsController < ApplicationController
  def new
  end

  def create
    message = params[:message]
    if message_valid?(message)
      ContactsMailer.contact_email(current_user, message).deliver_now
      flash[:notice] = t('flash.message.contact_email.success')
      redirect_to root_path
    else
      flash[:alert] = t('flash.message.contact_email.fail')
      render :new
    end
  end

  private

  def message_valid?(message)
    message.present?
  end
end
