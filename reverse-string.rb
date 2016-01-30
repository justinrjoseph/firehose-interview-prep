require 'minitest/autorun'

class StringReverse
  
  def initialize(string = nil)
    @string = string
  end

	def reverse
	  
	  return nil if @string.nil?
	  
    @string.to_s.chars.inject("") { |result, char| result = char + result }

	end

end



class StringReverseTest < MiniTest::Test
  
  def test_reverse_nil_case
    
    string = StringReverse.new
    
    assert_nil string.reverse
    
  end

  def test_reverse_short_string
    
    string = StringReverse.new "hello"
    
    assert_equal "olleh", string.reverse
    
  end

  def test_reverse_long_string
    
    string = StringReverse.new "It's peanut butter jelly time."
    
    assert_equal ".emit yllej rettub tunaep s'tI", string.reverse
  end

end