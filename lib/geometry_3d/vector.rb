class Vector
  attr_accessor :x
  attr_accessor :y
  attr_accessor :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  # Construct a vector with two points.
  #
  # Example:
  #   >> Vector.construct_with_two_points(Point.new(1, 2, 3), Point.new(3, 2, 1))
  #   => Vector.new(2, 0, -2)
  #
  # Arguments:
  #   first_point: (Point)
  #   second_point: (Point)

  def self.construct_with_two_points(first_point, second_point)
    Vector.new(*second_point.to_a.zip(first_point.to_a).map { |a, b| a - b} )
  end

  # Construct a vector as normal vector to a plane.
  #
  # Example:
  #   >> Vector.construct_with_plane(Plane.new(-2, 5, 2.5, 7))
  #   => Vector.new(-2, 5, 2.5)
  #
  # Arguments:
  #   first_point: (Point)
  #   second_point: (Point)

  def self.construct_with_plane(plane)
    Vector.new(*plane.to_a.take(3))
  end

  # Finds the sum vector of two vectors.
  #
  # Example:
  #   >> Vector.new(1, 2, 3) + (Vector.new(-2, 1, 2))
  #   => Vector.new(-1, 3, 5)
  #
  # Arguments:
  #   vector: (Vector)

  def +(vector)
    Vector.new(*to_a.zip(vector.to_a).map { |a, b| a + b } )
  end

  # Finds the scalar product of two vector.
  #
  # Example:
  #   >> Vector.new(1, 2, 3).scalar_product(Vector.new(-2, 1, 2))
  #   => 6
  #
  # Arguments:
  #   vector: (Vector)

  def scalar_product(vector)
    to_a.zip(vector.to_a).map { |a, b| a * b }.reduce(:+)
  end

  # Finds a vector perpendicular to both vectors.
  #
  # Example:
  #   >> Vector.new(1, 2, 3).cross_product(Vector.new(-2, 1, 2))
  #   => Vector.new(1, -8, 5)
  #
  # Arguments:
  #   vector: (Vector)

  def cross_product(vector)
    coordinate_x = y * vector.z - z * vector.y
    coordinate_y = z * vector.x - x * vector.z
    coordinate_z = x * vector.y - y * vector.x
    Vector.new(coordinate_x, coordinate_y, coordinate_z)
  end

  def to_a()
    [x, y, z]
  end

  def ==(vector)
    x == vector.x and y == vector.y and z == vector.z
  end
end