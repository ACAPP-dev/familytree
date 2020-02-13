class Helpers

    def self.current_user(session_hash)
        @user ||= User.find_by(id: session_hash[:user_id]) if session_hash[:user_id]
    end

    def self.logged_in?(session_hash)
        !!Helpers.current_user(session_hash)
    end
end