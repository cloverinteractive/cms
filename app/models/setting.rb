class Setting < ActiveRecord::Base
  validates :name, :value, presence: true
  validates :name, uniqueness: true

  validates_format_of :name, with: /^[a-z0-9_]+$/

  attr_accessible :name, :value, :description, :destroyable

  def delete
    return super if destroyable?
    false
  end

  def self.get_site_settings
    Setting.select('name, value').inject( {} ) do |site, setting|
      site[setting.name.to_sym] = setting.value
      site
    end
  end
end
