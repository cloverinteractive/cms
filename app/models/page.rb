class Page < ActiveRecord::Base
  include GenerateUrlName
  acts_as_taggable_on :keywords
  has_many :images,     :as => :attachable, :dependent => :destroy
  has_many :documents,  :as => :attachable, :dependent => :destroy 
  
  before_validation :strip_name
  before_save :is_home_page?
  
  belongs_to :section
  
  validates_presence_of     :name, :content
  validates_uniqueness_of   :name
  validates_numericality_of :section_id, :message => 'needs to be set', :greater_than => 0
  validate                  :create_url_name
  
  accepts_nested_attributes_for :images #,    :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :documents #, :reject_if => lambda { |a| a[:description].blank? }, :allow_destroy => true
  
  scope :published, where(:published => true)
  
  def self.home_page
    where(:home_page => true).first
  end
  
  def is_home_page?
    if self.home_page
      @page = Page.where("home_page = ?", true).first
      @page.update_attributes(:home_page => false) if @page.present? && @page != self
    end
  end
end