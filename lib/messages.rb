module Messages
    # retrieving messages 
    def get_messages(page_number = 1)
        response = self.class.get(api_url("message_threads"), headers: { "authorization" => @auth_token })
        JSON.parse(response.body)
    end

    # creating message
    def create_message(sender, recipient_id, token, subject, text)
        response = self.class.post(api_url("messages"), headers: { "authorization" => @auth_token }, body: {"sender" => sender, "recipient_id" => recipient_id, "token" => token, "subject" => subject, "stripped-text" => text })
        puts response
    end
end
