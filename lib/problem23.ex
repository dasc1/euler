defmodule Problem23 do

  def answer do
    abundants = 1..28123
    |> Xutils.parfilter(&abundant/1)
    1..28123
    |> Xutils.parfilter(&(not_sum_of_two(abundants, abundants, &1)))
    |> Xmath.sum
    |> IO.puts
  end

  defp abundant(n) do
    sumdiv = Xmath.proper_divisors2(n)
    |> Xmath.sum
    sumdiv > n
  end

  defp not_sum_of_two(abun, [h|tail], x) do
    cond do
      h > x/2 -> true
      Enum.member?(abun, x-h) -> false
      true -> not_sum_of_two(abun, tail, x)
    end
  end

end # defmodule
