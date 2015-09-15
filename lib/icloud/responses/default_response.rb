module Icloud
  class DefaultResponse < Response
    def parse
    end

    def process(client)
      puts 'Default Response!'
    end
  end
end
