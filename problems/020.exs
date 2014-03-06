defmodule X do

  def answer, do: 100 |> fact |> sumdigits

  def fact(1), do: 1
  def fact(x), do: x * fact(x-1)

  def sumdigits(x) when x < 10, do: x
  def sumdigits(x),
    do: rem(x, 10) + sumdigits(div(x, 10))

end
