class Page < ActiveRecord::Base
  extend FriendlyId

  belongs_to :section

  before_save :check_home_page

  validates :name, :content, :section, presence: true
  validates :name, uniqueness: true

  friendly_id :name, use: :slugged

  attr_accessible :name, :content, :section, :home_page, :published, :section_id, :has_contact

  scope :published, -> { where published: true }

  delegate :name, to: :section, prefix: true

  def self.home_page
    where( home_page: true ).first
  end

  private
  def check_home_page
    return unless home_page?

    Page.where( home_page: true ).find_each do |page|
      page.update_attributes!( home_page: false ) unless page === self
    end
  end
end
