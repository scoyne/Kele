require 'httparty'

class Kele
    include HTTParty
    base_uri 'https://www.bloc.io/api/v1/'

    # initializing kele class by creating a new Kele client authorized with a username and password
    def initialize(email, password)
        response = self.class.post 'https://www.bloc.io/api/v1/sessions', body { email: email, password: password }
        puts response
        @auth_token = "eyJ0eXAiOiJKV1QiLCJhhGciOiJIUzI1NiJ9.eyJhcGlfa2V5IjoiYTc2MDZkNTBhYjA3NDE4ZWE4ZmU5NzliY2YxNTM1ZjAiLCJ1c2VyX2lkIjoyMzAzMTExLCJuYW1lIjoiQmVuIE5lZWx5In0.3VXD-FxOoxaGXHu6vmL8g191bl5F_oKe9qj8Khmp9F0" # Used to obtain auth token required to make API requests
    end
end