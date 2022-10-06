class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # member_signed_in?
  # current_member
  # member_session
end
