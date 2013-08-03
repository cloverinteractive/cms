module Users
  class RegistrationsController < Devise::RegistrationsController
    before_filter :deactivate_action, only: [ :create, :new ]

    private
    def deactivate_action
      render 'public/404', formats: :html, status: :not_found, layout: false
    end
  end
end
