require 'httparty'

class Kele
    include HTTParty
    base_uri 'https://www.bloc.io/api/v1/'

    # initializing kele class by creating a new Kele client authorized with a username and password
    def initialize(email, password)
        response = self.class.post('https://www.bloc.io/api/v1/sessions', body: { email: email, password: password })
        @auth_token = response["auth_token"] # Used to obtain auth token required to make API requests
        raise "Invalid email address or password!" if response.code != 200
        puts response.email
    end
    
end