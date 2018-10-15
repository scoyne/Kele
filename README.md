# Kele API Client

Bloc's API provides an external facing JSON Web Token authorized gateway to the Bloc application. You can access it via cURL, but an API client can manage the low-level details of making requests and handling responses. Build the Kele API Client to provide easy access to and use of the student endpoints of Bloc's API.

## Project Overivew

* A user can initialize and authorize Kele with a Bloc username and password
* A user can retrieve the current user as a JSON blob
* A user can retrieve a list of mentor's availability
* A user can retrieve their roadmaps and checkpoints

---

## Kele API Client can is build using

* Ruby 2.4.1
* HTTParty Gem
* JSON Gem

---

## Install the Kele API Client

1. Add this gem to your application's Gemfile: 
    
    _**gem 'kele'**_
2. Run the bundle command to add the Kele gem
    
    _**bundle install**_

## Utilize the Kele API Client

The Kele API Client can be used with an existing Bloc.io student's email and password to interface with the API.

1. Enter the virtual Ruby environment
    
    _**$ irb**_
2. While in the environment you will need to initialize the client
    
    _**>> require './lib/kele'**_
    
    _**=> true**_
    
    _**>> Kele.new("john@gmail.com", "Changeme111")**_

You are now ready to interact with the API connection.

3. To retrieve the current user as a JSON blob type the following:
    
    _**>> kele_client.get_me**_

4. To retrieve a list of mentor's availability
    
    _**>> kele_client.get_mentor_availability(mentor_id)**_

5. To retrieve their roadmaps
    
    _**>> kele_client.get_roadmap(roadmap_id)**_

6. To retrieve a list of checkpoints remaining in current section
    
    _**>> kele_client.get_checkpoint(checkpoint_id)**_

---
Enjoy
