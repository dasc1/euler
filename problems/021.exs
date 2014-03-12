defmodule X do

  def answer do
    4..9999
    |> Enum.filter(&amicable?/1)
    |> sum
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
    |> sum
    a + 1
  end

  def sum(xs), do: _sum(xs, 0)
  defp _sum([],tot), do: tot
  defp _sum([a|tail], tot), do: _sum(tail, tot+a)

end # defmodule
