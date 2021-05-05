class RegistrationsController < Devise::RegistrationsController

  before_action :check_new_registration_allowed?, only: [:new, :create]

  protected

  # The Control model contains switch that turns registrations on and off
  def check_new_registration_allowed?
    redirect_to root_path unless Control.first.registrations_enabled
  end

end
