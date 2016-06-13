class FloorRoute
  attr_reader :route_string

  def initialize(string)
    @route_string = string
  end

  def final_floor
    @route_string.count('(') - @route_string.count(')')
  end

  def first_basement
      floor = 0
      step = 0
      result = nil
      @route_string.each_char { |char|
         step += 1
         if char == '('
           floor = floor + 1
         elsif char == ')'
           floor = floor - 1
           if floor < 0
             result = step
             break
           end
         end
      }
      return result
  end
end
