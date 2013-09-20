class Dashboard::PagesController < ApplicationController
  before_filter :find_page, only: [ :edit, :update, :destroy ]

  set_tab :list_pages,  only: :index
  set_tab :new_page,    only: :new

  def index
    @pages = Page.includes( :section ).page params[:page]
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new params[:page]

    if @page.save
      redirect_to dashboard_pages_path, flash: { success: t('messages.created_successfully')  }
    else
      render :new
    end
  end

  def update
    if @page.update_attributes params[:page]
      redirect_to edit_dashboard_page_path( @page ), flash: { success: t('messages.updated_successfully') }
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to dashboard_pages_path
  end

  private
  def find_page
    @page = Page.find params[:id]
  end
end
