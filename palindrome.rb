require 'minitest/autorun'

class String
  
  def initialize(string = "")
    @string = string.to_s.gsub(/[_,.\s]/, '').strip
  end

	def palindrome?
	  @string.chars.reverse.join.eql? @string
	end

end



class PalindromeTest < MiniTest::Test
  
  def test_empty_string
    
    string = String.new
    
    assert string.palindrome?
    
  end

  def test_one_letter_string
    
    string = String.new "a"
    
    assert string.palindrome?
    
  end

  def test_racecar
    
    string = String.new "racecar"
    assert string.palindrome?
  	
  	string = String.new "  race_car   "
    assert string.palindrome?
    
    string = String.new "race, car."
    assert string.palindrome?
    
  end

  def test_non_palindromes
    
    string = String.new "yolo"
  	refute string.palindrome?
  	
  	string = String.new "swag"
    refute string.palindrome?
    
    string = String.new "house"
    refute string.palindrome?
    
  end

end