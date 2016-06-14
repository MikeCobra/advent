class HouseRoute
  attr_reader :route

  def initialize(string)
    @route = string
  end

  def location
    {
      x: @route.count('>') - @route.count('<'),
      y: @route.count('^') - @route.count('v')
    }
  end

  def visited_houses
    location = {x: 0, y: 0}
    houses = Set.new [location]

    @route.each_char { |char|
      case char
      when '<'
        location = {x: location[:x] - 1, y: location[:y]}
      when '>'
        location = {x: location[:x] + 1, y: location[:y]}
      when '^'
        location = {x: location[:x], y: location[:y] + 1}
      when 'v'
        location = {x: location[:x], y: location[:y] - 1}
      end
      houses.add(location)
    }
    houses.to_a
  end
end
