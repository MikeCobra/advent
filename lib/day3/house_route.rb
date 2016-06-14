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

  def visited_houses_with_robot
    normal_santa_chars = @route.chars.select.with_index { |_, i| i.even? }
    normal_santa_route = HouseRoute.new normal_santa_chars.join('')
    robot_santa_chars = @route.chars.select.with_index { |_, i| i.odd? }
    robot_santa_route = HouseRoute.new robot_santa_chars.join('')

    houses = Set.new(normal_santa_route.visited_houses)
    houses.merge robot_santa_route.visited_houses
    houses.to_a
  end
end
