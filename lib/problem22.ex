defmodule Problem22 do

  def base, do: ?A - 1 # number - base will be alphabetic score

  def answer do
    "resources/022_names.txt"
    |> Xfile.file_to_string
    |> remove_double_quotes
    |> String.split(",")
    |> Enum.sort
    |> Enum.with_index
    |> Xutils.parmap(&score/1)
    |> Xmath.sum
    |> IO.puts
  end

  defp score_name("", tot), do: tot
  defp score_name(<<a, b::binary>>, tot),
    do: score_name(b, tot + a - base)

  defp score({name, index}) do
    score_name(name, 0) * (index + 1)
  end

  defp remove_double_quotes(string) do
    bc <<n>> inbits string, n != ?", do: <<n>>
  end

end
