require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'markdpwn'

class MiniTest::Test
  # The contents at test/fixtures/name.
  def code_fixture(name)
    File.read File.join(File.dirname(__FILE__), 'fixtures', name)
  end
end

MiniTest.autorun
