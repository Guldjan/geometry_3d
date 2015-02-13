class Sphere
  attr_accessor :point
  attr_accessor :radius

  def initialize(point, radius)
    @point = point
    @radius = radius
  end

  # Find the surface area of a sphere.
  #
  # Example:
  #   >> Sphere.new(Point.new(1, 2, 3), 3).surface_area
  #   => 113.09733552923254
  #
  # Arguments:
  #   no

  def surface_area
    4 * Math::PI * radius ** 2
  end

  # Find the volume of a sphere.
  #
  # Example:
  #   >> Sphere.new(Point.new(1, 2, 3), 3).volume
  #   => 113.09733552923254
  #
  # Arguments:
  #   no

  def volume
    (4.0 / 3) * Math::PI * radius ** 3
  end

  # Find the circumference of a sphere.
  #
  # Example:
  #   >> Sphere.new(Point.new(1, 2, 3), 3).circumference
  #   => 18.84955592153876
  #
  # Arguments:
  #   no

  def circumference
    Circle.new(radius).perimeter
  end

  # Checks if two spheres intersect/
  #
  # Example:
  #   >> Sphere.new(Point.new(-7, -4, 3), 20).intersect?(Sphere.new(Point.new(17, 6, 2.5), 7))
  #   => true
  #
  # Arguments:
  #   no

  def intersect?(sphere)
    point.distance_to_point(sphere.point) <= (radius + sphere.radius)
  end

end