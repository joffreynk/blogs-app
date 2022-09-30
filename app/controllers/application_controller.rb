class ApplicationController < ActionController::Base
    def self.current_user(id)
        @user_all_initial = User.find(id)
    end
end
