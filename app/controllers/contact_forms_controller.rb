class ContactFormsController < ApplicationController
  def create
    @contact_form = ContactForm.new params[:contact_form]

    if @contact_form.deliver
      flash[:success] = t 'messages.email_sent'
    else
      flash[:error] = t 'messages.failed_miserably'
    end

    redirect_to :back
  end
end
