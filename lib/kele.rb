require 'httparty'
require 'json'

class Kele
    include HTTParty
    base_uri 'https://www.bloc.io/api/v1/'

    # initializing kele class by creating a new Kele client authorized with a username and password
    def initialize(email, password)
        response = self.class.post('https://www.bloc.io/api/v1/sessions', body: { email: email, password: password })
        @auth_token = response["auth_token"] # Used to obtain auth token required to make API requests
        raise "Invalid email address or password!" if response.code == 404
    end

    # retrieving the current user
    def get_me
        response = self.class.get('https://www.bloc.io/api/v1/users/me', headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end
end