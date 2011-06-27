class Section < ActiveRecord::Base
  acts_as_authorization_object

  has_many    :pages
  has_many    :subsections,   :class_name => "Section", :foreign_key => :main_section_id
  belongs_to  :main_section,  :class_name => "Section", :foreign_key => :main_section_id

  before_validation       :set_url_name    
  validates_uniqueness_of :name, :url_name, :allow_blank => false
  validates_presence_of   :name

  private
  def set_url_name
    self.url_name = name.try( :parameterize )
  end
end
