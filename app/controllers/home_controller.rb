class HomeController < ApplicationController
  # authenticate_user! is not defined in ApplicationController as a before_action,
  # so we don't need to skip it.
  # However, if we wanted to be explicit or if it was added later, we could use:
  # skip_before_action :authenticate_user!, only: [:index], raise: false

  def index
  end
end
