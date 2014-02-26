defmodule X do

  def solve008 do
    ns = get_num_string('resources/008_onethousand.txt')
    findmax ns, 0
  end

  defp get_num_string(filename) do
    {:ok, file} = File.open(filename, [:utf8])
    file
    |> IO.stream(:line)
    |> Enum.map(&String.rstrip/1)
    |> Enum.join
  end

  defp findmax(<<a, b, c, d, e, t::binary>>, max) do
    prod = [a,b,c,d,e]
    |> Enum.map(&(&1-?0))
    |> List.foldl(1, &(&1 * &2))
    newmax = Enum.max [prod, max]
    newstr = <<b::utf8, c::utf8, d::utf8, e::utf8, t::binary>>
    findmax newstr, newmax
  end
  defp findmax(_list, max), do: max

end
