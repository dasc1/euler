defmodule X do

  def answer, do: tridiv(1, 2, 0)

  def numdivisors(1), do: 1
  def numdivisors(x) do
    cap = Float.floor(:math.sqrt(x))
    d = 1..cap
    |> Enum.to_list
    |> Enum.filter(&(rem(x, &1) == 0))
    |> Enum.count
    d * 2 # every found number, and x / that number
  end


  def tridiv(tri, _next, divisors) when divisors > 500, do: {tri, divisors}
  def tridiv(tri, next, _divisors),
    do: tridiv(tri + next, next + 1, numdivisors(tri + next))

end
