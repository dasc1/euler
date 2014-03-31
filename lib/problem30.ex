defmodule Problem30 do

  def answer do
    2..999999
    |> Enum.filter(&test/1)
    |> Xmath.sum
    |> IO.puts
  end

  defp test(n) do
    sumfives = n
    |> to_char_list
    |> Enum.map(&(&1 - ?0))
    |> Enum.map(&(:math.pow &1,5))
    |> Xmath.sum
    sumfives == n
  end


end
