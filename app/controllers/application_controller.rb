class ApplicationController < ActionController::Base
  before_filter :set_locale, :authenticate_user!
  layout :guess_layout

  rescue_from ActiveRecord::RecordNotFound,     with: :page_not_found
  rescue_from Clover::PageNotFoundError,        with: :page_not_found
  rescue_from Clover::UnauthorizedAccessError,  with: :unauthorized_access

  protect_from_forgery

  helper_method :site

  def site
    @site ||= Setting.get_site_settings
  end

  private
  def set_locale
    session[:locale]  = params[:locale] || site[:default_locale]
    I18n.locale       = session[:locale]
  end

  def devise_layout
    return 'sessions' unless controller_name === 'registrations'
    set_tab :edit_user
    return 'dashboard'
  end

  def website_layout
    return "themes/#{ site[:theme] || 'default' }/theme"
  end

  def dashboard_controller?
    controller_path =~ /^dashboard\/[a-z_]+$/
  end

  def guess_layout
    return devise_layout  if devise_controller?
    return 'dashboard'    if dashboard_controller?

    website_layout
  end

  protected
  def unauthorized_access
    redirect_to new_user_session_path, flash: { info: t('messages.unauthorized_access') }
  end

  def page_not_found
    render 'public/404', formats: [ :html ], status: :not_found, layout: false
  end
end
