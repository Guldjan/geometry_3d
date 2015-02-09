class Triangle
  attr_accessor :point_a
  attr_accessor :point_b
  attr_accessor :point_c

  def initialize(point_a, point_b, point_c)
    @point_a = point_a
    @point_b = point_b
    @point_c = point_c
  end

  # Find the plane in which the triangle lies.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_plane
  #   => Plane.new(30, -48, 17, 15)
  #
  # Arguments:
  #   no

  def get_plane
    Plane.construct_with_three_points(point_a, point_b, point_c)
  end

  # Find the line in which the AB side of the triangle lies.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_ab
  #   => Line.new(Point.new(1, 2, 3), Vector.new(3, 4, 6))
  #
  # Arguments:
  #   no

  def get_line_ab
    Line.construct_with_two_points(point_a, point_b)
  end

  # Find the line in which the BC side of the triangle lies.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_bc
  #   => Line.new(Point.new(4, 6, 9), Vector.new(8, 5, 0))
  #
  # Arguments:
  #   no

  def get_line_bc
    Line.construct_with_two_points(point_b, point_c)
  end

  # Find the line in which the AC side of the triangle lies.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_ac
  #   => Line.new(Point.new(1, 2, 3), Vector.new(11, 9, 6))
  #
  # Arguments:
  #   no

  def get_line_ac
    Line.construct_with_two_points(point_a, point_c)
  end

  # Find the median of the triangle from the point A
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_median_a
  #   => Line.new(Point.new(1, 2, 3), Vector.new(7, 6.5, 6))
  #
  # Arguments:
  #   no

  def get_median_a
    Line.construct_with_two_points(point_a, point_b.get_midpoint(point_c))
  end

  # Find the median of the triangle from the point B.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_median_b
  #   => Line.new(Point.new(4, 6, 9), Vector.new(2.5, 0.5, -3))
  #
  # Arguments:
  #   no
#Line.new(Point.new(4, 6, 9), Vector.new(2, 0, -3)).find_intersecting_point(Line.new(Point.new(12, 11, 9), Vector.new(-10, -7, -3)))
  def get_median_b
    Line.construct_with_two_points(point_b, point_a.get_midpoint(point_c))
  end

  # Find the median of the triangle from the point C.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_median_c
  #   => Line.new(Point.new(12, 11, 9), Vector.new(-9.5, -7, -3))
  #
  # Arguments:
  #   no

  def get_median_c
    Line.construct_with_two_points(point_c, point_a.get_midpoint(point_b))
  end

  # Find the centroid of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_centroid
  #   => Point.new(5.666666666, 6.333333333, 7)
  #
  # Arguments:
  #   no

  def get_centroid
    get_median_a.find_intersecting_point(get_median_b)
  end
end