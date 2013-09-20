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

  private
  def scoped_collection
    Section.select( 'name, id' ).where( "id != ?", id ).where( main_section_id: nil ).
      map { |section| [ section.name, section.id ] }
  end
end
