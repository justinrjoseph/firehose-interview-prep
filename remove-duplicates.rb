require 'minitest/autorun'

class Uniques

  def initialize(array = [])
    @array = array
  end

  def cleanup
    
    @array.to_a.inject(Hash.new(0)) do |result, value|
      result[value] = 1
      result
    end.keys
    
  end

end



class UniquesTest < MiniTest::Test

  def test_nil_case
    
    array = Uniques.new
    
    assert_equal [], array.cleanup
    
  end

  def test_array
    
    array = Uniques.new [1, 5, "frog", 2, 1, 3, "frog"]
    
    assert_equal [1, 5, "frog", 2, 3], array.cleanup
    
  end

end