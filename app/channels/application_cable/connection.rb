module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def disconnect

    end


    protected

    def find_verified_user
      if verified_user = request.env['warden'].user
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end



# This method will return a user record if the user is logged in. If the user
# isn't logged in, we're going to use Rails' default method to reject the connection attempt.
# request.env['warden'] is an environment variable containing information about the current user
# The connection.rb file can be used to run any sort of code before the connection
# between a user and the server is established. This can be useful for authentication, for example.
# Here you can authenticate the users who are able to connect to the ActionCable server.
