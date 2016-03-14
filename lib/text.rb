 require 'twilio-ruby'

class Text

  def send_message
    account_sid = 'AC3d02b29a4a421c70c7f06fee131bbe54'
    auth_token = ENV['AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
    	:from => '+441620282033',
    	:to => ENV['MY_NUM'],
    	:body => 'Thank you! Your order was placed and will be delivered before 18:52',
    })
  end
end
