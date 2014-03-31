defmodule Problem28 do

  def answer do
    sediag = build_diag(1, [3])
    |> Enum.reverse
    |> Xmath.sum
    sumto500 = (1 + 500) * 250
    IO.puts (sediag * 4) + (12 * sumto500) + 1
  end

  defp build_diag(500, list), do: list
  defp build_diag(n, list = [h|_tail]),
    do: build_diag(n+1, [h + 8*n + 2 | list])

end
