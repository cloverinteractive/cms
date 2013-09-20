class PagesController < ApplicationController
  skip_before_filter  :authenticate_user!
  after_filter        :raise_if_page_not_found!

  # GET /:section/:page
  # GET /:section/:subsection/:page
  def show
    @section  = Section.find params[:section]
    @page     = @section.pages.published.find( params[:page] ) if @section
  end

  #GET /
  def home
    @page     = Page.published.home_page
    @section  = @page.section

    render :show
  end

  private
  def raise_if_page_not_found!
    raise Clover::PageNotFoundError unless @page.present?
  end
end
