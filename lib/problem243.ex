defmodule Problem243 do

  def answer do
    targa = 15499
    targb = 94744
    gcache = HashDict.new
    # targa = 4
    # targb = 10
    resilient(2, 1, targa, targb, gcache)
    |> IO.puts
  end

  defp gcd(a,0), do: a
  defp gcd(a,b), do: gcd(b, rem(a,b))

  defp gcdcache({a,b}, gc) do
    if (HashDict.has_key?(gc, {a,b})) do
      {HashDict.fetch!(gc, {a,b}), gc}
    else
      g = gcd(a,b)
      newgc = HashDict.put(gc, {a,b}, g)
      {g, newgc}
    end
  end

  defp resilient(n, resil, targa, targb, _gc) 
    when resil * targb < targa * (n-1),
    do: n
  defp resilient(n, _resil, targa, targb, gc) do
    {resil2, gc2} = resilience(n+1, gc)
    resilient(n+1, resil2, targa, targb, gc2)
  end

  defp resilience(n, gc) do
    {bools, ngc} = 1..n-1
    |> Enum.to_list
    |> res2(n, gc)
    mycount = Enum.filter(bools, &(&1)) |> Enum.count
    {mycount, ngc}
  end

  defp res2(list, num, gc) do
    Enum.reduce(list, {[], gc}, fn(x, acc) ->
      {list, oldgc} = acc
      {g, newgc} = gcdcache({num, x}, oldgc)
      {[g == 1 | list], newgc}
    end)
  end

end
