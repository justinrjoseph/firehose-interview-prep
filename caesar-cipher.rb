require 'minitest/autorun'

class CaesarCipher
  
  def initialize(string = "")
    @string = string.to_s
  end

	def rot13_encryption
		
		if @string.length == 1
		  convert @string
    else
      @string.split('').map { |letter| convert(letter) }.join
		end

	end
	
	private
	
	  def convert(letter)

      return letter if letter.eql? " "

	    letters_1 = ('a'..'m').to_a + ('A'..'M').to_a
		  letters_2 = ('n'..'z').to_a + ('N'..'Z').to_a
		  
		  x = letters_1.index(letter)
      y = letters_2.index(letter)

		  if letter =~ /[A-Z]/ && letters_1.include?(letter)
		    return letters_2[x].upcase
		  elsif letter =~ /[a-z]/ && letters_1.include?(letter)
		    return letters_2[x]
		  end

		  if letter =~ /[A-Z]/ && letters_2.include?(letter)
		    return letters_1[y].upcase
		  elsif letter =~ /[a-z]/ && letters_2.include?(letter)
		    return letters_1[y]
		  end
		  
	  end

end



class CaesarCipherTest < MiniTest::Test
  
  def test_empty_string
    
    caesar_cipher = CaesarCipher.new
    
    assert_equal "", caesar_cipher.rot13_encryption
    
  end

  def test_one_letter_string
    
    caesar_cipher = CaesarCipher.new "a"
    
    assert_equal "n", caesar_cipher.rot13_encryption
    
  end

  def test_lowercase_and_capital
    
    caesar_cipher = CaesarCipher.new "aB"
    
    assert_equal "nO", caesar_cipher.rot13_encryption
    
  end

  def test_string
    
    caesar_cipher = CaesarCipher.new "Julius ATTACK Gaul Now"
    
    assert_equal "Whyvhf NGGNPX Tnhy Abj", caesar_cipher.rot13_encryption
    
  end

  def test_two_transformations_results_in_the_same
    
    string = "Julius ATTACK Gaul Now"
    
    first_caesar_cipher = CaesarCipher.new string
  	
  	first_caesar_cipher = first_caesar_cipher.rot13_encryption
  	
  	second_caesar_cipher = CaesarCipher.new first_caesar_cipher
  	
    assert_equal string, second_caesar_cipher.rot13_encryption
    
  end

end