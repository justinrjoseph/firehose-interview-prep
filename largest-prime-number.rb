require 'minitest/autorun'

class LargestPrimeFactor

  def initialize(number = nil)
    @number = number
  end

  def largest_prime_factor
    
    return nil if @number.nil?

    (@number - 1).downto(1).inject([]) do |result, number|
      result << number if number.is_prime? && @number % number == 0
      result
    end.max
    
  end
  
end

class Integer
  
  def is_prime?
    
    return false if self <= 1
    
    Math.sqrt(self).to_i.downto(2).each { |i| return false if self % i == 0 }
    
  end
  
end



class LargestPrimeFactorTest < MiniTest::Test
  
  def test_nil_case
    
    number = LargestPrimeFactor.new
  	
  	assert_nil number.largest_prime_factor
  	
  end

  def test_small_number
    
    number = LargestPrimeFactor.new 10
  	
  	assert_equal 5, number.largest_prime_factor
  	
  end

  def test_large_number
    
    number = LargestPrimeFactor.new 13195
  	
  	assert_equal 29, number.largest_prime_factor
  	
  end

end