defmodule Problem29 do

  def answer do
    bounds = Enum.to_list 2..100
    (lc x inlist bounds, y inlist bounds, do: pow(x,y))
    |> Enum.uniq
    |> length
    |> IO.puts
  end

  defp pow(a,b), do: Float.floor :math.pow a,b

end
