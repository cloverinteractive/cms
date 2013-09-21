class PagesController < ApplicationController
  skip_before_filter  :authenticate_user!

  # GET /:section/:page
  # GET /:section/:subsection/:page
  def show
    @section, @subsection, @page = *Section.with_children( params )
    raise_if_page_not_found!
  end

  #GET /
  def home
    @page     = Page.published.home_page
    @section  = @page.section

    raise_if_page_not_found!

    render :show
  end

  private
  def raise_if_page_not_found!
    raise Clover::PageNotFoundError unless @page.present?
  end
end
