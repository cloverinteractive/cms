class Dashboard::PagesController < ApplicationController
  before_filter :set_section
  before_filter :set_page, :only => [ :edit, :update, :destroy ]

  access_control do
    allow :admin
  end

  set_tab :list_pages, :only => :index
  set_tab :new_page, :only => :new

  # GET /pages
  def index
    @pages = @section.pages.page params[:page]
  end

  # GET /pages/new
  def new
    @page = @section.pages.new
  end

  # POST /pages
  def create
    @page = @section.pages.new params[:page].except('keywords')
    @page.keyword_list = params[:page][:keywords] if params[:page][:keywords].present?

    if @page.save
      flash[:success] = t 'messages.created_successfully'
      redirect_to dashboard_section_pages_path(@section)
    else
      render :new
    end
  end

  # PUT /pages/1
  def update
    @page.keyword_list = params[:page][:keywords] if params[:page][:keywords].present?

    if @page.update_attributes params[:page].except('keywords')
      flash[:success] = t 'messages.updated_successfully'
      redirect_to dashboard_section_pages_path(@section)
    else
      render :edit
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to dashboard_section_pages_path(@section)
  end

  private
  def set_section
    @section ||= Section.find params[:section_id]
  end

  def set_page
    @page ||= set_section.pages.find params[:id]
  end
end
