defmodule X do

  def answer do
    500_000..1_000_000
    |> Enum.map(&dupe/1)
    |> crunch
  end

  def crunch([{x, _cur}]), do: x
  def crunch(nums) do
    nums
    |> Enum.map(&collatz_next/1)
    |> Enum.filter(&collatz_continue?/1)
    |> crunch
  end

  def dupe(x), do: {x, x}
  def collatz_next({num, current}) when rem(current, 2) == 0,
    do: {num, div(current,2)}
  def collatz_next({num, current}),
    do: {num, 3 * current + 1}
  def collatz_continue?({_num, x}), do: x != 1

end
