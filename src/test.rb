require 'rack/test'
require 'test/unit'
require_relative  'server'

set :environment, :test

class ServerTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_response_is_ok
    get '/'

    assert last_response.ok?
    assert last_response.body.include?('Bin2Dec')
  end

  def test_bin2dec
    post '/convert', JSON.generate('binaryNumber' => '100'), 'CONTENT_TYPE' => 'application/json'
    assert_equal 4, JSON.parse(last_response.body)['decimalNumber']

    post '/convert', JSON.generate('binaryNumber' => '1000'), 'CONTENT_TYPE' => 'application/json'
    assert_equal 8, JSON.parse(last_response.body)['decimalNumber']

    post '/convert', JSON.generate('binaryNumber' => '10000001'), 'CONTENT_TYPE' => 'application/json'
    assert_equal 129, JSON.parse(last_response.body)['decimalNumber']
  end
end