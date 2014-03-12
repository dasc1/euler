defmodule X do

  def answer do
    4..9999
    |> Xutils.parfilter(&amicable?/1)
    |> Xmath.sum
  end

  def amicable?(n) do
    amic = divisors(n)
    amic != n and divisors(amic) == n
  end

  def divisors(1), do: 0
  def divisors(2), do: 1
  def divisors(3), do: 1
  def divisors(n) do
    a = 2..div(n,2)
    |> Enum.filter(&(rem(n, &1) == 0))
    |> Xmath.sum
    a + 1
  end

end # defmodule
