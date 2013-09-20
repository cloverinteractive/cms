class Dashboard::SectionsController < ApplicationController
  before_filter :find_section, only: [ :edit, :update, :destroy ]

  set_tab :list_sections, only: :index
  set_tab :new_section,   only: :new

  # GET /sections
  def index
    @sections = Section.includes( :main_section ).page params[:page]
  end

  # GET /sections/1
  def show
    @section = Section.find params[:id]
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # POST /sections
  def create
    @section = Section.new params[:section]

    if @section.save
      redirect_to dashboard_sections_path, flash: { success: t('messages.created_successfully') }
    else
      render :new
    end
  end

  # PUT /sections/1
  def update
    if @section.update_attributes params[:section]
      redirect_to dashboard_sections_path, flash: { success: t('messages.updated_successfully') }
    else
      render :edit
    end
  end

  # DELETE /sections/1
  def destroy
    @section.destroy
    redirect_to dashboard_sections_path
  end

  private
  def find_section
    @section = Section.find params[:id]
  end
end
