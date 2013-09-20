class Dashboard::SettingsController < ApplicationController
  before_filter :find_setting, only: [ :edit, :update, :destroy ]

  set_tab :list_settings, only: :index
  set_tab :new_setting,   only: :new

  def index
    @settings = Setting.page params[:page]
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new params[:setting]

    if @setting.save
      redirect_to dashboard_settings_path, flash: { success: t('messages.created_successfully') }
    else
      render :new
    end
  end

  def update
    if @setting.update_attributes params[:setting]
      redirect_to dashboard_settings_path, flash: { success: t('messages.updated_successfully') }
    else
      render :edit
    end
  end

  def destroy
    if @setting.destroyable? and @setting.destroy
      redirect_to dashboard_settings_path, flash: { success: t('messages.deleted_successfully') }
    else
      redirect_to dashboard_settings_path, flash: { error: t('messages.failed_miserably') }
    end
  end

  private
  def find_setting
    @setting  = Setting.find params[:id]
    @themes   = $themes
  end
end
