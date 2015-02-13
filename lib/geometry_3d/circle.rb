class Circle
  attr_accessor :point
  attr_accessor :radius
  attr_accessor :vector

  def initialize(point = Point.new(0, 0, 0), vector = Vector.new(0, 0, 1), radius)
    @point = point
    @radius = radius
    @vector = vector
  end

  # Find the area of a circle.
  #
  # Example:
  #   >> Circle.new(Point.new(1, 2, 3), Vector.new(1, 1, 1), 3)
  #   => 28.274333882308138
  #
  # Arguments:
  #   no

  def area
    Math::PI * radius ** 2
  end

  # Find the perimeter of a circle.
  #
  # Example:
  #   >> Circle.new(Point.new(1, 2, 3), Vector.new(1, 1, 1), 3)
  #   => 18.84955592153876
  #
  # Arguments:
  #   no

  def perimeter
    2 * Math::PI * radius
  end
end

