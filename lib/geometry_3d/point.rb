class Point
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  # Translate a point with a vector
  #
  # Example:
  #   >> Point.new(2, -1, 3).translate(Vector.new(1, 2, 3))
  #   => Point.new(3, 1, 6)
  #
  # Arguments:
  #   vector: (Vector)

  def translate(vector)
    Point.new(*to_a.zip(vector.to_a).map { |a, b| a + b})
  end

  # Check if a point is on a plane
  #
  # Example:
  #   >> Point.new(1, 1, 1).is_on_plane?(Plane.new(1, 2, 3, -6))
  #   => true
  #
  # Arguments:
  #   plane: (Plane)

  def is_on_plane?(plane)
    (plane.a * x + plane.b * y + plane.c * z + plane.d) == 0
  end

  # Check if a point is on a line
  #
  # Example:
  #   >> Point.new(1, 1, 4).is_on_line?(Line.new(Point.new(2, -1, 3), Vector.new(-1, 2, 1)))
  #   => true
  #
  # Arguments:
  #   line: (Line)

  def is_on_line?(line)
    to_a.zip(line.point.to_a, line.vector.to_a).map { |a, b, c| (a - b) / c }.uniq.length == 1
  end

  # Find the distance between two points
  #
  # Example:
  #   >> Point.new(-7, -4, 3).distance_to(Point.new(17, 6, 2.5))
  #   => 26.004807247891687
  #
  # Arguments:
  #   point: (Point)

  def distance_to(point)
    to_a.zip(point.to_a).map{|a, b| (b - a) ** 2}.reduce(:+) ** 0.5
  end

  # Find the midpoint between two points
  #
  # Example:
  #   >> Point.new(-7, -4, 3).get_midpoint(Point.new(17, 6, 2.5))
  #   => Point.new(5, 1, 2.75)
  #
  # Arguments:
  #   point: (Point)

  def get_midpoint(point)
    Point.new(*to_a.zip(point.to_a).map { |a, b| (a + b) / 2.0 })
  end

  def to_a
    [x, y, z]
  end


  def ==(point)
    @x == point.x and @y == point.y and @z == point.z
  end

  def round(number)
    Point.new(*to_a.map{|x| x.round(number)})
  end


end

