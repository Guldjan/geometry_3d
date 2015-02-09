class LinearEquation
  attr_accessor :a
  attr_accessor :b
  attr_accessor :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def solve_system(equation)
    y = (equation.a * c - a * equation.c) / (a * equation.b - equation.a * b).to_f
    x = (- c - b * y) / a.to_f
    [x, y]
  end
end
