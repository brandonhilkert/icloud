require 'protocol_buffers'

module Icloud
  class ProtoBufResponse < Response
    def parse(definition_class)
      @content = definition_class.parse(content)
    rescue Exception => e
      p content, e
    end

    def [](key)
      @content.send(key)
    end
  end
end
