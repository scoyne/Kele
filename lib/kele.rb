require 'httparty'
require 'json'

class Kele
    include HTTParty
    base_uri 'https://www.bloc.io/api/v1/'

    # initializing kele class by creating a new Kele client authorized with a username and password
    def initialize(email, password)
        response = self.class.post('sessions', body: { email: email, password: password })
        @auth_token = response["auth_token"] # Used to obtain auth token required to make API requests
        raise "Invalid email address or password!" if response.code == 404
    end

    # retrieving the current user
    def get_me
        response = self.class.get('users/me', headers: { "authorization" => @auth_token })
        @user = JSON.parse(response.body)
    end

    # retrieving mentor availability
    def get_mentor_availability()
        # "mentor_id"=>2367142
        response = self.class.get('mentors//student_availability', headers: { "authorization" => @auth_token })
        @available = JSON.parse(response.body)
        
    end

    private
    def api_url
    end

end