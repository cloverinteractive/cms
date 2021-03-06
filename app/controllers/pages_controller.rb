class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  # GET /:section/:page
  # GET /:section/:subsection/:page
  def show
    @page   = subsection.pages.published.find( params[:page] ) if subsection
    @page ||=    section.pages.published.find( params[:page] ) if section

    raise Clover::PageNotFoundError if @page.blank?

    if @page.has_contact?
      @contact_form = render_to_string :partial => 'contact_forms/contact_form', :object => ContactForm.new
    end
  end

  #GET /
  def home
    @page     = Page.published.home_page
    @section  = @page.section
    render :show
  end

  private
  def subsection
    @subsection ||= Section.where( :slug => params[:subsection] ).first
  end

  def section
    @section    = @subsection.try :main_section
    @section  ||= Section.find params[:section]
  end
end
