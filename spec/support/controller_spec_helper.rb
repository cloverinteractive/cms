module ControllerSpecHelpers
  def login_as( user, role=nil )
    @controller.class.any_instance.stubs( :current_user ).returns user
    @controller.class.any_instance.stubs( :authenticate_user! ).returns true

    user.has_role! role if role.present?
  end
end

RSpec.configure do |config|
  config.include ControllerSpecHelpers, :type => :controller
end
