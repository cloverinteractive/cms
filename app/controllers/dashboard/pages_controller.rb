class Dashboard::PagesController < ApplicationController
  before_filter :set_page, :only => [ :edit, :update, :destroy ]

  access_control do
    allow :admin
  end

  set_tab :list_pages, :only => :index
  set_tab :new_page, :only => :new

  # GET /pages
  def index
    @pages = Page.page params[:page]
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # POST /pages
  def create
    @page = Page.new params[:page].except('keywords')
    @page.keyword_list = params[:page][:keywords] if params[:page][:keywords].present?

    if @page.save
      flash[:success] = t 'messages.created_successfully'
      redirect_to dashboard_pages_path
    else
      render :new
    end
  end

  # PUT /pages/1
  def update
    @page.keyword_list = params[:page][:keywords] if params[:page][:keywords].present?

    if @page.update_attributes params[:page].except('keywords')
      flash[:success] = t 'messages.updated_successfully'
      redirect_to dashboard_pages_path
    else
      render :edit
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to dashboard_pages_path
  end

  private
  def set_page
    @page ||= Page.find params[:id]
  end
end
