require 'minitest/autorun'

class Factorial

  def initialize(number = nil)
    @number = number
  end

  def factorial
    
    return nil if @number.nil?
    
    product = @number
    
    (@number - 1).downto(2).inject(product) { |product, number| product *= number }
    
  end

end



class FactorialTest < MiniTest::Test

  def test_nil_case
    
    number = Factorial.new

    assert_nil number.factorial
    
  end

  def test_factorial
    
    number = Factorial.new 13
    
    assert_equal 6227020800, number.factorial
    
  end

end
