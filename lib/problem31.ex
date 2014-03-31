defmodule Problem31 do

  def answer do
    List.duplicate(1,201) # 1 way to make 0p, 1p, ..., 200p with pennies
    |> addcoin(2)
    |> addcoin(5)
    |> addcoin(10)
    |> addcoin(20)
    |> addcoin(50)
    |> addcoin(100)
    |> addcoin(200)
    |> Enum.at(200)
    |> IO.puts
  end

  defp addcoin(list, cval) do
    0..200
    |> Enum.to_list
    |> Enum.map(&(count_ways(&1, cval, list)))
  end

  defp count_ways(total, cval, list) do
    0..div(total, cval) 
    |> Enum.to_list
    |> Enum.map(&(Enum.at(list, total - &1 * cval)))
    |> Xmath.sum
  end

end
