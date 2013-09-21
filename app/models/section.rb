class Section < ActiveRecord::Base
  extend FriendlyId

  has_many    :pages, dependent: :destroy

  has_many    :subsections,   class_name: "Section", foreign_key: :main_section_id, dependent: :destroy
  belongs_to  :main_section,  class_name: "Section", foreign_key: :main_section_id

  validates :name, presence: true, uniqueness: true

  friendly_id :name, use: :slugged

  attr_accessible :name, :main_section_id

  delegate :name, to: :main_section, prefix: true, allow_nil: true

  def section_collection
    return scoped_collection unless new_record?

    Section.section_collection
  end

  def self.section_collection
    Section.select( 'name, id' ).all.map { |section| [ section.name, section.id ] }
  end

  def self.with_children( params )
    section     = includes( :pages ).find_by_slug params[:section]
    subsection  = fetch_subsection( section, params[:subsection] )    if section and params[:subsection]
    page        = fetch_page ( subsection || section ), params[:page]

    [ section, subsection, page ]
  end

  def self.fetch_subsection( section, slug )
    section.subsections.find_by_slug slug
  end

  def self.fetch_page( section, slug )
    return if section.nil?
    section.pages.published.find_by_slug slug
  end

  private
  def scoped_collection
    Section.select( 'name, id' ).where( "id != ?", id ).where( main_section_id: nil ).
      map { |section| [ section.name, section.id ] }
  end
end
