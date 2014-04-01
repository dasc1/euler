defmodule Problem81 do

  import Enum, only: ['map': 2]

  def answer do
    matrix = "resources/081_matrix.txt"
    |> Xfile.file_to_lines
    |> map(&(String.split(&1, ",")))
    |> map(
         fn xs -> map(xs,
           fn x ->
             Integer.parse(x) |> elem(0) 
           end)
         end)
    |> Enum.reverse
    |> Enum.map(&(Enum.reverse(&1)))  # now matrix is mirrored in both directions
    firstrow = [0 | List.duplicate(9999999,79)]
    mergeblock(matrix, firstrow)
    |> List.last
    |> IO.puts
  end

  defp mergeblock([], row), do: row
  defp mergeblock([h|t], row), 
    do: mergeblock(t, mergelines(h, row))

  defp mergelines(newline, oldline) do
    Enum.reduce(
      Enum.zip(newline, oldline),
      [9999999],
      fn (x,acc) ->
        {new, old} = x
        [h|_] = acc
        newelem = new + min(h, old)
        [newelem | acc]
      end
    ) |> Enum.reverse |> tail
  end

  defp tail([_h|t]), do: t

end
