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

  # Finds the intersecting point of two lines. If the two lines do not intersect returns nil.
  #
  # Example:
  #   >> Line.new(Point.new(4, 19, 12), Vector.new(1, 6, 5)).find_intersecting_point_with_line(Line.new(Point.new(-3, -15, -19), Vector.new(2, 8, 8)))
  #   => Point.new(1, 1, -3)
  #
  # Arguments:
  #   line: (Line)

  def find_intersecting_point_with_line(line)
    if (intersect? line)
      eq1 = LinearEquation.new(vector.x, -line.vector.x, point.x - line.point.x)
      eq2 = LinearEquation.new(vector.y, -line.vector.y, point.y - line.point.y)
      find_point (eq1.solve_system(eq2)[0])
    end
  end

  # Find intersecting point of line and plane. If the line and the plane do not intersect nil is returned.
  #
  # Example:
  #   >> Line.new(Point.new(1, 0, 1), Vector.new(3, -2, 1)).find_intersecting_point_with_plane(Plane.new(1, 1, 1, -6))
  #   => Point.new(7, -4, 3)
  #
  # Arguments:
  #   plane: (Plane)

  def find_intersecting_point_with_plane(plane)
    if (intersect_plane? plane)
      find_point(- plane.substitute(point) / (plane.substitute(vector) - plane.d).to_f)
    end
  end

  # Find the angle(degrees) between line and plane. If the line and the plane do not intersect nil is returned.
  #
  # Example:
  #   >> Line.new(Point.new(1, 0, 1), Vector.new(2, 1, 2)).find_angle_with_plane(Plane.new(1, 1, 0, -6))
  #   => 45
  #
  # Arguments:
  #   plane: (Plane)

  def find_angle_with_plane(plane)
    if (intersect_plane? plane)
      numer = (vector.scalar_product(plane.find_normal_vector)).abs
      denom = (vector.length * plane.find_normal_vector.length)
      Math.asin(numer / denom) * (180 / Math::PI)
    end
  end

  # Check if two lines are parallel.
  #
  # Example:
  #   >> Line.new(Point.new(1, 0, 1), Vector.new(3, -2, 1)).parallel?(Line.new(Point.new(2, 0, 1), Vector.new(6, -4, 2)))
  #   => true
  #
  # Arguments:
  #   line: (Line)

  def parallel? (line)
    vector.x * line.vector.y == vector.y * line.vector.x and vector.y * line.vector.z == vector.z * line.vector.y
  end

  # Check if two lines intersect.
  #
  # Example:
  #   >> Line.new(Point.new(4, 19, 12), Vector.new(1, 6, 5)).intersect?(Line.new(Point.new(-3, -15, -19), Vector.new(2, 8, 8)))
  #   => true
  #
  # Arguments:
  #   line: (Line)

  def intersect?(line)
      eq1 = LinearEquation.new(vector.x, -line.vector.x, point.x - line.point.x)
      eq2 = LinearEquation.new(vector.y, -line.vector.y, point.y - line.point.y)
      eq3 = LinearEquation.new(vector.z, -line.vector.z, point.z - line.point.z)
      (eq1.solve_system(eq2) == eq2.solve_system(eq3)) and (not parallel? line)
  end

  # Check if two lines are skew.
  #
  # Example:
  #   >> Line.new(Point.new(4, -5, 1), Vector.new(2, 4, 3)).skew?(Line.new(Point.new(2, -1, 0), Vector.new(1, 3, 2)))
  #   => true
  #
  # Arguments:
  #   line: (Line)

  def skew?(line)
    not (parallel? line) and not(intersect? line)
  end

  # Check if a line and a plane are parallel.
  #
  # Example:
  #   >> Line.new(Point.new(4, -5, 1), Vector.new(2, 4, 3)).parallel_to_plane?(Plane.new(1, 1, 1, 3))
  #   => true
  #
  # Arguments:
  #   plane: (Plane)

  def parallel_to_plane?(plane)
    plane.find_normal_vector.scalar_product(vector) == 0
  end

  # Check if a line and a plane intersect.
  #
  # Example:
  #   >> Line.new(Point.new(4, -5, 1), Vector.new(2, 4, 3)).intersect_plane?(Plane.new(1, 2, 1, 3))
  #   => true
  #
  # Arguments:
  #   plane: (Plane)

  def intersect_plane?(plane)
    not parallel_to_plane? plane
  end

  def ==(line)
    point == line.point and vector == line.vector
  end

  private
  def find_point(parameter)
    Point.new(*point.to_a.zip(vector.to_a).map { |a, b| a + b * parameter})
  end

end