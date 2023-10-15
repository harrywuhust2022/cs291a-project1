require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the triangle method in the file 'triangle.rb'
require './triangle.rb'

class AboutTriangleProject2 < Neo::Koan
  # The first assignment did not talk about how to handle errors.
  # Let's handle that part now.
  def test_illegal_triangles_throw_exceptions
    assert_raise(TriangleError) do triangle(0, 0, 0) end
    assert_raise(TriangleError) do triangle(3, 4, -5) end
    assert_raise(TriangleError) do triangle(1, 1, 3) end
    assert_raise(TriangleError) do triangle(2, 4, 2) end
    # HINT: for tips, see http://stackoverflow.com/questions/3834203/ruby-koan-151-raising-exceptions
  end

  def triangle(l1, l2, l3)
    if [l1, l2, l3].min <= 0
      raise TriangleError
    end
    
    x, y, z = [l1, l2, l3].sort
    
    if x + y <= z
      raise TriangleError
    end
    [:equilateral,:isosceles,:scalene].fetch([l1, l2, l3].uniq.size - 1)
  end
end