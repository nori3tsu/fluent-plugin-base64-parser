require_relative '../helper'
require 'openssl'
require 'fluent/test'
require 'fluent/parser'
require 'fluent/plugin/parser_base64'

include Fluent

class Base64ParserTest < ::Test::Unit::TestCase
  def test_encode
    parser = Plugin::Base64Parser.new
    parser.configure('message_key' => 'msg', 'base64_encode' => true)

    text = 'foo'
    expected_record = {'msg' => 'Zm9v' }

    parser.parse(text) {|time, record|
      assert_equal(expected_record, record)
    }
  end

  def test_decode
    parser = Plugin::Base64Parser.new
    parser.configure('message_key' => 'msg', 'base64_encode' => false)

    text = 'Zm9v'
    expected_record = {'msg' => 'foo' }

    parser.parse(text) {|time, record|
      assert_equal(expected_record, record)
    }
  end
end
