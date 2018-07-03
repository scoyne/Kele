module Messages
    # retrieving messages 
    def get_message(message_id)
        response = self.class.get(api_url("message_threads"), headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    # sending messages
#    def get_checkpoint(checkpoint_id)
#        response = self.class.get(api_url("checkpoints/#{checkpoint_id}"), headers: { "authorization" => @auth_token })
#        JSON.parse(response.body)
#    end
end