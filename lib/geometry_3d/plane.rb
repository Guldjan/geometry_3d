class Plane
  attr_accessor :a
  attr_accessor :b
  attr_accessor :c
  attr_accessor :d

  def initialize(a, b, c, d)
    @a = a
    @b = b
    @c = c
    @d = d
  end

  # Construct a plane passing through three points.
  #
  # Example:
  #   >> Plane.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9))
  #   => Plane.new(30, -48, 17, 15)
  #
  # Arguments:
  #   point1: (Point)
  #   point2: (Point)
  #   point3: (Point)

  def self.construct_with_three_points(point1, point2, point3)
    vector1 = Vector.construct_with_two_points(point1, point3)
    vector2 = Vector.construct_with_two_points(point1, point2)
    construct_with_two_vectors_and_point(vector1, vector2, point1)
  end



  # Construct plane with normal vector and passing through a point.
  #
  # Example:
  #   >> Plane.construct_with_normal_vector_and_point(Vector.new(-2, 3, 1), Point.new(1, 1, 1))
  #   => Plane.new(-2, 3, 1, -2)
  #
  # Arguments:
  #   vector: (Vector)
  #   point: (Point)

  def self.construct_with_normal_vector_and_point(vector, point)
    Plane.new(*vector.to_a, find_d(vector.to_a, point))
  end

  # Construct a plane parallel to two vectors and passing through a point.
  #
  # Example:
  #   >> Plane.construct_with_two_vectors_and_point(Vector.new(1, 2, 3), Vector.new(-2, 1, 2), Point.new(1, 1, 1))
  #   => Plane.new(30, -48, 17, 15)
  #
  # Arguments:
  #   vector1: (Vector)
  #   vector2: (Vector)
  #   point: (Point)

  def self.construct_with_two_vectors_and_point(vector1, vector2, point)
    vector = vector1.cross_product(vector2)
    construct_with_normal_vector_and_point(vector, point)
  end

  # Construct a plane parallel other plane and passing through a point.
  #
  # Example:
  #   >> Plane.construct_with_plane_and_point(Plane.new(2, -3, 4, 5), Point.new(1, 1, 1))
  #   => Plane.new(2, -3, 4, -3)
  #
  # Arguments:
  #   vector1: (Vector)
  #   vector2: (Vector)
  #   point: (Point)

  def self.construct_with_plane_and_point(plane, point)
    Plane.new(*plane.to_a.take(3), find_d(plane.to_a.take(3), point))
  end

  def to_a
    [a, b, c, d]
  end

  # Find normal vector of the plane
  #
  # Example:
  #   >> Plane.new(2, -5, 1.5, 3)
  #   => Vector.new(-2, -5, 1.5)
  #
  # Arguments:
  #   no

  def find_normal_vector()
    Vector.construct_with_plane(self)
  end

  # Find intersecting line of two planes. If the two planes do not intersect, returns nil.
  #
  # Example:
  #   >> Plane.new(2, -5, 3, -12).find_intersecting_line_of_planes(Plane.new(3, 4, -3, -6))
  #   => Line.new(Point.new(0, -18, -26), Vector.new(3, 15, 23))
  # Arguments:
  #   plane: (Plane)

  def find_intersecting_line_of_planes(plane)
    if (intersect? plane)
      vector = find_normal_vector.cross_product(plane.find_normal_vector)
      eq1 = LinearEquation.new(b, c, d)
      eq2 = LinearEquation.new(plane.b, plane.c, plane.d)
      array = eq1.solve_system(eq2)
      point = Point.new(0, array[0], array[1])
      Line.new(point, vector)
    end
  end

  # Check if two planes are parallel.
  #
  # Example:
  #   >> Plane.new(1, 2, 3, 5).parallel?(Plane.new(2, 4, 6, -4))
  #   => true
  #
  # Arguments:
  #   plane: (Plane)

  def parallel?(plane)
    a * plane.b == b * plane.a and c * plane.b == b * plane.c
  end

  # Check if two planes intersect.
  #
  # Example:
  #   >> Plane.new(1, 2, 3, 5).parallel?(Plane.new(2, -4, 6, -4))
  #   => true
  #
  # Arguments:
  #   plane: (Plane)

  def intersect?(plane)
    not parallel? plane
  end

  def ==(plane)
    to_a.zip(plane.to_a).map { |a, b| a == b}.reduce(:&)
  end

  private
  def self.find_d(array, point)
    - array.zip(point.to_a).map { |a, b| a * b }.reduce(:+)
  end
end