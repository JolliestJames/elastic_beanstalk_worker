require 'sinatra/base'
require 'logger'

class Worker < Sinatra::Base
  set :logging, true
  
  @@logger = Logger.new('/tmp/sample-app.log')

  post '/' do
    msg_id = request.env["HTTP_X_AWS_SQSD_MSGID"]
    data = request.body.read
    @@logger.info "Received message: #{data}"
  end
end
