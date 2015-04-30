require 'webrick'

class WebServer
  class << self
    def start(port, document_root)
      return if @running
      server = WEBrick::HTTPServer.new options(port, document_root)
      Thread.new { server.start }
      at_exit { server.shutdown }
      @running = true
    end

    def options(port, document_root)
      default = {
        :Port => port.to_i,
        :DocumentRoot => document_root,
      }
      disable_logging = {
        :AccessLog => [],
        :Logger => WEBrick::Log::new("/dev/null", 7)
      }
      unless ENV['DEBUG']
        default.merge disable_logging
      else
        default
      end
    end
  end
end
