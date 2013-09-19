class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :registerable

  validates :username, presence: true, uniqueness: true
  validates :username, format: { with: /\A[\w\.\-@]+\z/ }
  validates :username, length: { minimum: 4, maximum: 10 }

  attr_accessor :login
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :login

  protected
  def self.find_for_database_authentication(conditions)
    login = conditions.delete :login
    where(conditions).where([ "username = :value OR email = :value", { value: login } ]).first
  end
end
