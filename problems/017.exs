defmodule X do

  def answer do
    1..999
    |> Enum.to_list
    |> Enum.map(&xlen/1)
    |> Enum.reduce(&(&1+&2))
    |> add11
  end

  def add11(x), do: x + 11

  def xlen(num) do
    z = div(num, 100)
    a = rem(num, 100)
    y = div(a, 10)
    x = rem(a, 10)
    numlen(z,y,x)
  end

  def numlen(0, 0, x), do: Enum.at([0,3,3,5,4,4,3,5,5,4], x) # zero to nine
  def numlen(0, 1, x), do: Enum.at([3,6,6,8,8,7,7,9,8,8], x) # ten to nineteen
  def numlen(0, y, x),
    do: Enum.at([0,0,6,6,5,5,5,7,6,6], y) + numlen(0, 0, x)
  def numlen(z, 0, 0),
    do: Enum.at([0,3,3,5,4,4,3,5,5,4], z) + 7
  def numlen(z, y, x),
    do: Enum.at([0,3,3,5,4,4,3,5,5,4], z) + 10 + numlen(0, y, x)

end
