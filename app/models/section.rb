class Section < ActiveRecord::Base
  extend FriendlyId

  has_many    :pages
  has_many    :subsections,   class_name: "Section", foreign_key: :main_section_id
  belongs_to  :main_section,  class_name: "Section", foreign_key: :main_section_id

  validates :name, presence: true, uniqueness: true

  friendly_id :name, use: :slugged

  attr_accessible :name, :main_section_id

  delegate :name, to: :main_section, prefix: true, allow_nil: true
end
