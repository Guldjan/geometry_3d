require 'minitest/autorun'
require 'geometry_3d'

class PointTest < Minitest::Unit::TestCase
  def test_translate
    assert_equal Point.new(-2, 5, 4),
      Point.new(1, 2.5, 3).translate(Vector.new(-3, 2.5, 1))
  end

  def test_is_point_on_plane
    assert_equal true,
      Point.new(1, 1, 1).is_on_plane?(Plane.new(1, 2, 3, -6))
  end

  def test_is_on_line
    assert_equal true,
    Point.new(1, 1, 4).is_on_line?(Line.new(Point.new(2, -1, 3), Vector.new(-1, 2, 1)))
  end

  def test_distance_to
    assert_equal 26.0048,
    Point.new(-7, -4, 3).distance_to(Point.new(17, 6, 2.5)).round(4)
  end

  def test_get_midpoint
    assert_equal Point.new(5, 1, 2.75),
    Point.new(-7, -4, 3).get_midpoint(Point.new(17, 6, 2.5))
  end

end

class VectorTest < Minitest::Unit::TestCase
  def test_construct_with_two_points
    assert_equal Vector.new(2, 0, -2),
    Vector.construct_with_two_points(Point.new(1, 2, 3), Point.new(3, 2, 1))
  end

  def test_construct_with_plane
    assert_equal Vector.new(1, -3, 3.5),
    Vector.construct_with_plane(Plane.new(1, -3, 3.5, 4))
  end

  def test_scalar_product
    assert_equal 6,
    Vector.new(1, 2, 3).scalar_product(Vector.new(-2, 1, 2))
  end

  def test_cross_product
    assert_equal Vector.new(1, -8, 5),
    Vector.new(1, 2, 3).cross_product(Vector.new(-2, 1, 2))
  end

  def test_sum_vector
    assert_equal Vector.new(-1, 3, 5),
    Vector.new(1, 2, 3) + Vector.new(-2, 1, 2)
  end
end

class LineTest < Minitest::Unit::TestCase
  def test_construct_with_two_points
    assert_equal Line.new(Point.new(1, 2, 3), Vector.new(2, 0, -2)),
    Line.construct_with_two_points(Point.new(1, 2, 3), Point.new(3, 2, 1))
  end

  def test_intersecting_point_with_line_yes
    assert_equal Point.new(1, 1, -3),
    Line.new(Point.new(4, 19, 12), Vector.new(1, 6, 5)).find_intersecting_point_with_line(Line.new(Point.new(-3, -15, -19), Vector.new(2, 8, 8)))
  end

  def test_intersecting_point_with_line_no
    assert_equal nil,
    Line.new(Point.new(4, 19, 12), Vector.new(1, 6, 2)).find_intersecting_point_with_line(Line.new(Point.new(-3, -15, -19), Vector.new(2, 12, 4)))
  end

  def test_intersecting_point_with_plane_yes
    assert_equal Point.new(7, -4, 3),
    Line.new(Point.new(1, 0, 1), Vector.new(3, -2, 1)).find_intersecting_point_with_plane(Plane.new(1, 1, 1, -6))
  end

  def test_intersecting_point_with_plane_no
    assert_equal nil,
    Line.new(Point.new(1, 0, 1), Vector.new(3, -2, 1)).find_intersecting_point_with_plane(Plane.new(1, 1, -1, -6))
  end

  def test_parallel_yes
    assert_equal true,
     Line.new(Point.new(1, 0, 1), Vector.new(3, -2, 1)).parallel?(Line.new(Point.new(2, 0, 1), Vector.new(6, -4, 2)))
   end

   def test_parallel_no
    assert_equal false,
     Line.new(Point.new(1, 0, 1), Vector.new(1, -2, 1)).parallel?(Line.new(Point.new(2, 0, 1), Vector.new(6, -4, 2)))
   end

  def test_intersect_yes
    assert_equal true,
    Line.new(Point.new(4, 19, 12), Vector.new(1, 6, 5)).intersect?(Line.new(Point.new(-3, -15, -19), Vector.new(2, 8, 8)))
  end

  def test_intersect_no
    assert_equal false,
    Line.new(Point.new(4, 19, 12), Vector.new(1, 6, 2)).intersect?(Line.new(Point.new(-3, -15, -19), Vector.new(2, 12, 4)))
  end

  def test_skew_yes
    assert_equal true,
    Line.new(Point.new(4, -5, 1), Vector.new(2, 4, 3)).skew?(Line.new(Point.new(2, -1, 0), Vector.new(1, 3, 2)))
  end

  def test_skew_no
    assert_equal false,
    Line.new(Point.new(4, -5, 1), Vector.new(2, 4, 4)).skew?(Line.new(Point.new(2, -1, 0), Vector.new(1, 2, 2)))
  end

  def test_parallel_to_plane_yes
    assert_equal true,
    Line.new(Point.new(4, -5, 1), Vector.new(2, 4, 1)).parallel_to_plane?(Plane.new(2, -2, 4, 3))
  end

  def test_parallel_to_plane_no
    assert_equal false,
    Line.new(Point.new(4, -5, 1), Vector.new(2, 4, 3)).parallel_to_plane?(Plane.new(1, 1, 4, 3))
  end

  def test_intersect_plane_yes
    assert_equal true,
    Line.new(Point.new(4, -5, 1), Vector.new(2, 4, 3)).intersect_plane?(Plane.new(1, 9, 1, 3))
  end

  def test_intersect_plane_no
    assert_equal false,
    Line.new(Point.new(4, -5, 1), Vector.new(2, 4, 1)).intersect_plane?(Plane.new(2, -2, 4, 3))
  end

end

class TestPlane < Minitest::Unit::TestCase
  def test_find_normal_vector
    assert_equal Vector.new(4, -3, 2.5),
    Plane.new(4, -3, 2.5, 8).find_normal_vector
  end

  def test_construct_with_three_points
    assert_equal Plane.new(30, -48, 17, 15),
    Plane.construct_with_three_points(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9))
  end

  def test_construct_with_normal_vector_and_point
    assert_equal Plane.new(-2, 3, 1, -2),
    Plane.construct_with_normal_vector_and_point(Vector.new(-2, 3, 1), Point.new(1, 1, 1))
  end

  def test_construct_with_two_vectors_and_point
    assert_equal Plane.new(30, -48, 17, 15),
    Plane.construct_with_two_vectors_and_point(Vector.new(11, 9, 6), Vector.new(3, 4, 6), Point.new(1, 2, 3))
  end

  def test_construct_with_plane_and_point
    assert_equal Plane.new(2, -3, 4, -3),
    Plane.construct_with_plane_and_point(Plane.new(2, -3, 4, 5), Point.new(1, 1, 1))
  end

  def test_intersecting_line_of_planes_yes
    assert_equal Line.new(Point.new(0, -18, -26), Vector.new(3, 15, 23)),
    Plane.new(2, -5, 3, -12).find_intersecting_line_of_planes(Plane.new(3, 4, -3, -6))
  end

  def test_intersecting_line_of_planes_no
    assert_equal nil,
    Plane.new(2, 1, 2, -12).find_intersecting_line_of_planes(Plane.new(-4, -2, -4, -6))
  end

  def test_parallel_yes
    assert_equal true,
    Plane.new(1, 2, 3, 5).parallel?(Plane.new(2, 4, 6, -4))
  end

  def test_parallel_no
    assert_equal false,
    Plane.new(1, 2, -3, 5).parallel?(Plane.new(2, 4, 6, -4))
  end

  def test_intersect_yes
    assert_equal true,
    Plane.new(1, 2, -3, 5).intersect?(Plane.new(2, 4, 6, -4))
  end

  def test_parallel_no
    assert_equal false,
    Plane.new(1, 2, 3, 5).intersect?(Plane.new(2, 4, 6, -4))
  end


end

class TestCircle < Minitest::Unit::TestCase
  def test_area
    assert_equal 28.2743,
    Circle.new(Point.new(1,2,3), Vector.new(1, 1, 1), 3).area.round(4)
  end

  def test_perimeter
    assert_equal 18.8496,
    Circle.new(Point.new(1,2,3), Vector.new(1, 1, 1), 3).perimeter.round(4)
  end
end

class TestTriangle < Minitest::Unit::TestCase
  def test_get_plane
    assert_equal Plane.new(30, -48, 17, 15),
    Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_plane
  end

  def test_get_line_ab
    assert_equal Line.new(Point.new(1, 2, 3), Vector.new(3, 4, 6)),
    Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_ab
  end

  def test_get_line_bc
    assert_equal Line.new(Point.new(4, 6, 9), Vector.new(8, 5, 0)),
    Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_bc
  end

  def test_get_line_ac
    assert_equal Line.new(Point.new(1, 2, 3), Vector.new(11, 9, 6)),
    Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_line_ac
  end

  def test_get_median_a
    assert_equal Line.new(Point.new(1, 2, 3), Vector.new(7, 6.5, 6)),
    Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_median_a
  end

  def test_get_median_b
    assert_equal Line.new(Point.new(4, 6, 9), Vector.new(2.5, 0.5, -3)),
    Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_median_b
  end

  def test_get_median_c
    assert_equal Line.new(Point.new(12, 11, 9), Vector.new(-9.5, -7, -3)),
    Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_median_c
  end

  def test_get_centroid
    assert_equal Point.new(5.6667, 6.3333, 7),
    Triangle.new(Point.new(1, 2, 3), Point.new(4, 6, 9), Point.new(12, 11, 9)).get_centroid.round(4)
  end

end