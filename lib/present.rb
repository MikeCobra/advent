class Present
  attr_reader :length, :width, :height

  def initialize(length, width, height)
    @length = length
    @width = width
    @height = height
  end

  def self.from_string(string)
    length, width, height = string.split 'x'
    Present.new(length.to_i, width.to_i, height.to_i)
  end

  def smallest_side
    measures = [@length, @width, @height]
    measures = measures.sort

    measures[0] * measures[1]
  end

  def smallest_perimeter
    measures = [@length, @width, @height]
    measures = measures.sort

    2 * (measures[0] + measures[1])
  end

  def surface_area
    2 * (@length * @width + @width * @height + @height * @length)
  end

  def volume
    [@length, @width, @height].reduce(:*)
  end

  def required_ribbon
    smallest_perimeter + volume
  end

  def required_paper
    surface_area + smallest_side
  end

  def ==(another_present)
    @length == another_present.length && @width == another_present.width && @height == another_present.height
  end

  def to_s
    "#{@length}x#{@width}x#{@height}"
  end
end
