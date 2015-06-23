require_relative '../helper'
require 'openssl'
require 'fluent/test'
require 'fluent/parser'
require 'fluent/plugin/parser_base64'

include Fluent

class Base64ParserTest < ::Test::Unit::TestCase
  def test_encode
    parser = TextParser::Base64Parser.new
    parser.configure('message_key' => 'msg', 'base64_encode' => true)

    # for the old, return based API
    text = 'foo'
    expected_record = {'msg' => 'Zm9v' }
    time, record = parser.parse(text)
    assert_equal(expected_record, record)

    # for the new API
    parser.parse(text) {|time, record|
      assert_equal(expected_record, record)
    }
  end

  def test_decode
    parser = TextParser::Base64Parser.new
    parser.configure('message_key' => 'msg', 'base64_encode' => false)

    # for the old, return based API
    text = 'Zm9v'
    expected_record = {'msg' => 'foo' }
    time, record = parser.parse(text)
    assert_equal(expected_record, record)

    # for the new API
    parser.parse(text) {|time, record|
      assert_equal(expected_record, record)
    }
  end
end
