defmodule X do

  def solve006 do
    a = Enum.to_list 1..100
    sum = &(&1 + &2)
    square = &(&1 * &1)
    sum1 = a
    |> Enum.map(square)
    |> Enum.reduce(sum)
    sum2 = a
    |> Enum.reduce(sum)
    square.(sum2) - sum1
  end

end
