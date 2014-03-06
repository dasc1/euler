defmodule X do

  def answer18, do: process 'resources/018_triangle.txt'

  def answer67, do: process 'resources/067_triangle.txt'

  def process(filename) do
    filename
    |> File.open!([:utf8])
    |> IO.stream(:line)
    |> Enum.map(&String.strip/1)
    |> Enum.reverse
    |> Enum.map(&(String.split(&1, " ")))
    |> Enum.map(fn xs -> Enum.map(xs, &parse/1) end)
    |> crunch
  end

  def parse(str) do
    {x, _left} = Integer.parse(str)
    x
  end

  def crunch([[x]]), do: x
  def crunch([top = [_toph|topt] | [second | rest]]) do
    bottom1 = combadd(second, top)
    bottom2 = combadd(second, topt)
    newtop = combmax bottom1, bottom2
    crunch [newtop | rest]
  end

  def combadd(xs1, xs2) do
    Enum.zip(xs1, xs2)
    |> Enum.map(fn {a,b} -> a + b end)
  end

  def combmax(xs1, xs2) do
    Enum.zip(xs1, xs2)
    |> Enum.map(fn {a,b} -> Enum.max [a,b] end)
  end

end
