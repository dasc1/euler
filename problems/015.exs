defmodule X do

  def answer do 
    {_map, x} = numpaths(ListDict.new, 20, 20)
    x
  end

  def numpaths(map, 0, 0), do: {map, 1}
  def numpaths(map, -1, _x), do: {map, 0}
  def numpaths(map, _x, -1), do: {map, 0}
  def numpaths(map, x, y) do
    if ListDict.has_key?(map, {x,y}) do
      {map, map[{x,y}]}
    else
      {map2, patha} = numpaths(map, x-1, y)
      {map3, pathb} = numpaths(map2, x, y-1)
      tot = patha + pathb
      map4 = ListDict.put(map3, {x,y}, tot)
      {map4, tot}
    end
  end

end
