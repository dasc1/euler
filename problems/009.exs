defmodule X do

  def solve009 do
    solution =
       lc x inlist Enum.to_list(334..997),
       y inlist Enum.to_list(1..x-1),
       (z = (1000 - x - y)) > 0,
       x > y,
       y > z,
       triplet?(x, y, z),
       do: {x,y,z}
    [{a,b,c}] = solution
    a * b * c
  end

  defp triplet?(a,b,c), do: c*c + b*b == a*a

end
