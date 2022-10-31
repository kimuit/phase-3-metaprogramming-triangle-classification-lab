class Triangle
  # write code here
  attr_accessor :opposite, :adjacent, :hypotenuce

  def initialize(opposite, adjacent, hypotenuce)
    @opposite = opposite
    @adjacent = adjacent 
    @hypotenuce = hypotenuce
  end

  def kind
    validate_triangle
    if opposite == adjacent && adjacent == hypotenuce
      :equilateral
    elsif 
      opposite == adjacent || adjacent == hypotenuce || opposite == hypotenuce
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [opposite, adjacent, hypotenuce].all?(&:positive?)
  end

  def valid_triangle_inequality?
    opposite + adjacent > hypotenuce && opposite + hypotenuce > adjacent && adjacent + hypotenuce > opposite
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError
  end


end