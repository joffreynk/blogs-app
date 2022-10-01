class ApplicationController < ActionController::Base
  def self.current_user
    @user_all_initial = User.first
  end
end
