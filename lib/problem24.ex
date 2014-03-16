defmodule Problem24 do

  import Enum, only: [map: 2, reverse: 1, to_list: 1, at: 2, filter: 2]
  import Xmath, only: [factorial: 1]

  def answer do
    1..9
    |> map(&factorial/1)
    |> reverse
    |> grinder(to_list(0..9), [], 999_999)
    |> inspect
    |> IO.puts
  end

  defp grinder(_facts, [a], solution, _leftover), 
    do: reverse( [a|solution] )
  defp grinder([f1|facts], available, solution, leftover) do
    idx = div(leftover, f1)
    newleft = rem(leftover, f1)
    nextnum = at(available, idx)
    newavail = filter(available, &(&1 != nextnum))
    grinder(facts, newavail, [nextnum|solution], newleft)
  end

end # defmodule
