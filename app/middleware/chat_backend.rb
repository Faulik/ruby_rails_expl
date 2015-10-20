require 'faye/websocket'
require 'json'

Faye::WebSocket.load_adapter('thin')


class ChatBackend
  KEEPALIVE_TIME = 15

  def initialize(app)
    @app = app
    @clients = []
    @channels = {}
  end

  def call(env)
    if Faye::WebSocket.websocket?(env)
      ws = Faye::WebSocket.new(env, nil, { ping: KEEPALIVE_TIME })

      ws.on :open do |event|
        p [:open, ws.object_id]
        @clients << ws
      end

      ws.on :message do |event|
        p [:message, event.data]
        _data = JSON.parse(event.data)
        case _data["event_name"]
        when "register"
          register(_data["data"], ws)
        when "message"
          message(_data["data"])          
        end
      end

      ws.on :close do |event|
        p [:close, ws.object_id, event.code, event.reason]
        @clients.delete(ws)
        ws = nil
      end

      ws.rack_response
    else
      @app.call(env)  
    end
  end

  def register(data, ws)
    ( @channels[data["path"]] ||= [] ) << ws 
  end

  def message(data)
    @channels[data["path"]].each { |client| client.send(JSON.generate(data)) }
  end
end