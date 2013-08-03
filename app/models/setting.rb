class Setting < ActiveRecord::Base
  validates_presence_of  :name, :value
  validates_uniqueness_of :name

  validates_format_of :name, with: /^[a-z0-9_]+$/
  attr_accessible :name, :value, :description

  attr_accessible :name, :value, :description, :destroyable

  def delete
    return super if destroyable?
    false
  end

  def delete!
    return super if destroyable?
    false
  end

  def self.get_site_settings
    site = {}
    Setting.select('name, value').each do |setting|
      site[setting.name.to_sym] = setting.value
    end
    site
  end
end
