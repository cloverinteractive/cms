class Page < ActiveRecord::Base
  extend FriendlyId

  acts_as_taggable_on :keywords

  has_many :assets, :as => :attachable
  belongs_to :section

  before_save :check_home_page

  validates :name, :content, :section, :presence => true
  validates :name, :uniqueness => true

  friendly_id :name, :use => :slugged

  attr_accessible :name, :content, :section, :home_page, :published, :section_id, :has_contact

  scope :published, where(:published => true)

  def self.home_page
    where( :home_page => true ).first
  end

  private
  def check_home_page
    if home_page?
      Page.where("home_page = ?", true).each do |page|
        page.update_attributes( :home_page => false ) if page != self
      end
    end
  end
end
