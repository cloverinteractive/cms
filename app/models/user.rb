class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :registerable

  validates_format_of :username, with: /^([a-z0-9\-_.]{2,31})$/i

  attr_accessor :login
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :username, :login

  protected
  def self.find_for_database_authentication(conditions)
    login = conditions.delete :login
    where(conditions).where([ "username = :value OR email = :value", { value: login } ]).first
  end
end
