module Fluent
  class TextParser
    class Base64Parser < Parser
      Plugin.register_parser("base64", self)

      config_param :message_key, :string, :default => 'message'
      config_param :base64_encode, :bool, :default => true

      def initialize
        super
        require 'base64'
      end

      def parse(text)
        if (@base64_encode)
          puts ::Base64.encode64(text)
          return super.parse(::Base64.encode64(text))
        else
          return super.parse(::Base64.decode64(text))
        end
      end

      def parse(text)
        record = {}
        if (@base64_encode)
          record[@message_key] = ::Base64.strict_encode64(text)
        else
          record[@message_key] = ::Base64.strict_decode64(text)
        end

        time = @estimate_current_event ? Engine.now : nil
        if block_given?
          yield time, record
        else
          return time, record
        end
      end
    end
  end
end
