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
    if controller_name == 'registrations'
      set_tab :edit_user
      return 'dashboard'
    end

    'sessions'
  end

  def website_layout
    return "themes/#{ site[:theme] }/theme" if site[:theme].present?
    'themes/default/theme'
  end

  def dashboard_controller?
    params[:controller] =~ /^dashboard\/[a-z_]+$/
  end

  def guess_layout
    if dashboard_controller?
      'dashboard'
    elsif devise_controller?
      devise_layout
    else
      website_layout
    end
  end

  protected
  def unauthorized_access
    flash[:info] = t 'messages.unauthorized_access'
    redirect_to new_user_session_path
  end

  def page_not_found
    render 'public/404', formats: [ :html ], status: :not_found, layout: false
  end
end
