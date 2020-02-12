class Helpers

    def self.current_user
        @user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def self.logged_in?
        !!Helpers.current_user
    end
end