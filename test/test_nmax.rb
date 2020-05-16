require 'minitest/autorun'
require File.dirname(__FILE__) + '/../lib/nmax'

class TestNMax < Minitest::Test
  def test_raise_exception_without_arguments
    assert_raises(ArgumentError) { NMax.main }
  end
end
