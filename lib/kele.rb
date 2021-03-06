require 'httparty'
require 'json'
require './lib/roadmap.rb'

class Kele
    include HTTParty
    include Roadmap

    base_uri 'https://www.bloc.io/api/v1/'

    # initializing kele class by creating a new Kele client authorized with a username and password
    def initialize(email, password)
        response = self.class.post(api_url("sessions"), body: { email: email, password: password })
        @auth_token = response["auth_token"] # Used to obtain auth token required to make API requests
        raise "Invalid email address or password!" if response.code == 404
    end

    # retrieving the current user
    def get_me
        response = self.class.get(api_url("users/me"), headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    # retrieving mentor availability
    def get_mentor_availability(mentor_id)
        # "mentor_id"=>2367142
        response = self.class.get(api_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
        availability = []
        JSON.parse(response.body).each do |free_time|
            if free_time["booked"].nil?
                availability << free_time
            end
        end
        puts availability
    end

    # creating endpoint url for DRY code
    def api_url(endpoint)
        "https://www.bloc.io/api/v1/#{endpoint}"
    end
end