class Line
  attr_accessor :vector
  attr_accessor :point

  def initialize(point, vector)
    @point = point
    @vector = vector
  end

  # Construct a line with two points.
  #
  # Example:
  #   >> Line.construct_with_two_points(Point.new(1, 2, 3), Point.new(3, 2, 1))
  #   => Line.new(Point.new(1, 2, 3), Vector.new(2, 0, -2))
  #
  # Arguments:
  #   first_point: (Point)
  #   second_point: (Point)

  def self.construct_with_two_points(first_point, second_point)
    v = Vector.construct_with_two_points(first_point, second_point)
    Line.new(first_point, v)
  end

  # Find intersecting point of two lines.
  #
  # Example:
  #   >> Line.new(Point.new(1,-2,3), Vector.new(5,2,-1)).find_intersecting_point(Line.new(Point.new(-4,-4,1), Vector.new(-1,3,-1)))
  #   => Point.new(-4, -4, 4)
  #
  # Arguments:
  #   line: (Line)

  def find_intersecting_point(line)
    eq1 = LinearEquation.new(vector.x, -line.vector.x, point.x - line.point.x)
    eq2 = LinearEquation.new(vector.y, -line.vector.y, point.y - line.point.y)
    find_point (eq1.solve_system(eq2)[0])
  end

  def ==(line)
    point == line.point and vector == line.vector
  end

  private
  def find_point(parameter)
    Point.new(*point.to_a.zip(vector.to_a).map { |a, b| a + b * parameter})
  end

end