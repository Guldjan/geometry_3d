class Triangle
  attr_accessor :point_a
  attr_accessor :point_b
  attr_accessor :point_c

  def initialize(point_a, point_b, point_c)
    @point_a = point_a
    @point_b = point_b
    @point_c = point_c
  end

  # Finds the length of the AB side of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.new(2, 2, 7), Point.new(1, 3, 1)).length_ab
  #   => 6.164414002968976
  #
  # Arguments:
  #   no

  def length_ab
    point_a.distance_to_point(point_b)
  end

  # Finds the length of the BC side of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.new(2, 2, 7), Point.new(1, 3, 1)).length_bc
  #   => 6.164414002968976
  #
  # Arguments:
  #   no

  def length_bc
    point_b.distance_to_point(point_c)
  end

  # Finds the length of the AC side of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.new(2, 2, 7), Point.new(1, 3, 1)).length_ac
  #   => 2
  #
  # Arguments:
  #   no

  def length_ac
    point_a.distance_to_point(point_c)
  end

  # Finds the length of the height form point A of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.new(2, 2, 7), Point.new(1, 3, 1)).length_height_a
  #   => 6.082762530298219
  #
  # Arguments:
  #   no

  def length_height_a
    point_a.distance_to_line(get_line_bc)
  end

  # Finds the length of the height form point B of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.new(2, 2, 7), Point.new(1, 3, 1)).length_height_b
  #   => 1.9735087641318605
  #
  # Arguments:
  #   no

  def length_height_b
    point_b.distance_to_line(get_line_ac)
  end

  # Finds the length of the height form point C of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.+new(2, 2, 7), Point.new(1, 3, 1)).length_height_c
  #   => 6.082762530298219
  #
  # Arguments:
  #   no

  def length_height_c
    point_c.distance_to_line(get_line_ab)
  end

  # Finds the length of the median form point A of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.+new(2, 2, 7), Point.new(1, 3, 1)).length_median_a
  #   => 3.391164991562634
  #
  # Arguments:
  #   no

  def length_median_a
    point_a.distance_to_point(point_b.get_midpoint point_c)
  end

  # Finds the length of the median form point B of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.+new(2, 2, 7), Point.new(1, 3, 1)).length_median_b
  #   => 6.08276253029818
  #
  # Arguments:
  #   no

  def length_median_b
    point_b.distance_to_point(point_a.get_midpoint point_c)
  end

  # Finds the length of the median form point C of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.+new(2, 2, 7), Point.new(1, 3, 1)).length_median_c
  #   => 3.391164991562634
  #
  # Arguments:
  #   no

  def length_median_c
    point_c.distance_to_point(point_a.get_midpoint point_b)
  end

  # Finds the area of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.new(2, 2, 7), Point.new(1, 3, 1)).area
  #   => 1.9735087641318605
  #
  # Arguments:
  #   no

  def area
    (length_bc * length_height_a) / 2.0
  end

  # Finds the perimeter of the triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.new(2, 2, 7), Point.new(1, 3, 1)).perimeter
  #   => 14.32882800593795
  #
  # Arguments:
  #   no

  def perimeter
    length_ab + length_ac + length_bc
  end

  # Finds the radius of the inscribed circle in triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.new(2, 2, 7), Point.new(1, 3, 1)).radius_of_inscribed_circle
  #   => 0.8490244321137063
  #
  # Arguments:
  #   no

  def radius_of_inscribed_circle
    area / (perimeter / 2)
  end

  # Finds the radius of the circumscribed circle in triangle.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 1, 1), Point.new(2, 2, 7), Point.new(1, 3, 1)).radius_of_circumscribed_circle
  #   => 3.123580758801788
  #
  # Arguments:
  #   no

  def radius_of_circumscribed_circle
    (length_ab * length_bc * length_ac) / (4 * area)
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

  # Find the line in which the height from the point A lies.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_height_a
  #   => Line.new(Point.new(1, 2, 3), Vector.new(85, -136, -534))
  #
  # Arguments:
  #   no

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

  # Find the line in which the height from the point A lies.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_height_a
  #   => Line.new(Point.new(1, 2, 3), Vector.new(85, -136, -534))
  #
  # Arguments:
  #   no

  def get_line_height_a
    l = get_line_bc
    Line.new(point_a,  l.vector.cross_product(get_plane.find_normal_vector))
  end

  # Find the line in which the height from the point B lies.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_height_b
  #   => Line.new(Point.new(4, 6, 9), Vector.new(441, -7, -798))
  #
  # Arguments:
  #   no

  def get_line_height_b
    l = get_line_ac
    Line.new(point_b,  l.vector.cross_product(get_plane.find_normal_vector))
  end

  # Find the line in which the height from the point C lies.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_height_c
  #   => ine.new(Point.new(12, 11, 9), Vector.new(356, 129, -264))
  #
  # Arguments:
  #   no

  def get_line_height_c
    l = get_line_ab
    Line.new(point_c, l.vector.cross_product(get_plane.find_normal_vector))
  end

  # Find the median of the triangle from the point A
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_median_a
  #   => Line.new(Point.new(1, 2, 3), Vector.new(7, 6.5, 6))
  #
  # Arguments:
  #   no

  def get_line_median_a
    Line.construct_with_two_points(point_a, point_b.get_midpoint(point_c))
  end

  # Find the median of the triangle from the point B.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_median_b
  #   => Line.new(Point.new(4, 6, 9), Vector.new(2.5, 0.5, -3))
  #
  # Arguments:
  #   no

  def get_line_median_b
    Line.construct_with_two_points(point_b, point_a.get_midpoint(point_c))
  end

  # Find the median of the triangle from the point C.
  #
  # Example:
  #   >> Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_median_c
  #   => Line.new(Point.new(12, 11, 9), Vector.new(-9.5, -7, -3))
  #
  # Arguments:
  #   no

  def get_line_median_c
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
    get_line_median_a.find_intersecting_point_with_line(get_line_median_b)
  end
end