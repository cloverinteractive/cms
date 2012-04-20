module ControllerSpecHelpers
  def login_as( user )
    @controller.class.any_instance.stubs( :current_user ).returns user
    @controller.class.any_instance.stubs( :authenticate_user! ).returns true
  end
end

RSpec.configure do |config|
  config.include ControllerSpecHelpers, :type => :controller
end
