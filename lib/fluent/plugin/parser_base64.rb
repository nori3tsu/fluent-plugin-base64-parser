require "fluent/plugin/parser"

module Fluent
  module Plugin
    class Base64Parser < Parser
      Fluent::Plugin.register_parser("base64", self)

      config_param :message_key, :string, :default => 'message'
      config_param :base64_encode, :bool, :default => true

      def initialize
        super
        require 'base64'
      end

      def parse(text)
        record = {}
        if (@base64_encode)
          record[@message_key] = ::Base64.strict_encode64(text)
        else
          record[@message_key] = ::Base64.strict_decode64(text)
        end

        time = @estimate_current_event ? Fluent::Engine.now : nil
        yield time, record
      end
    end
  end
end
