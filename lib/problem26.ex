defmodule Problem26 do

  def answer do
    1..1000
    |> Xutils.parmap(fn x -> longdiv(x,10,[]) end)
    |> Enum.max_by(fn x -> elem x, 1 end)
    |> elem(0)
    |> IO.puts
  end

  defp longdiv(d, num, rems) when d > num,
    do: longdiv(d, num*10, rems)
  defp longdiv(d, num, rems) do
    r = rem(num, d)
    cond do
      r == 0 -> {d, 0}
      Enum.member?(rems, r) -> {d, findindex(rems, r) + 1}
      true -> longdiv(d, r * 10, [r|rems])
    end
  end
  defp findindex(coll, x) do
    coll
    |> Enum.take_while(&(&1 != x))
    |> length
  end


  defp tryrec(n, recs) when recs > 11, do: {n, 0} # non repeating?
  defp tryrec(n, recs) do
    if iswhole?(multiplier(recs) * 1_000_000 / n) do
      {n, recs}
    else
      tryrec(n, recs+1)
    end
  end
  
  defp multiplier(n), do: Enum.at([1, 9, 99, 999, 9_999, 99_999,
    999_999, 9_999_999, 99_999_999, 999_999_999, 9_999_999_999,
    99_999_999_999, 999_999_999_999], n)
  defp iswhole?(float), do: float == Float.floor(float + 0.0000001)

end
