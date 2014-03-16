defmodule Problem25 do

  def answer do
    IO.puts fib(1,1,1,2)
  end

  defp fib(_a, _b, len, termnum) when len >= 1000, do: termnum
  defp fib(a, b, _len, termnum) do
    c = a + b
    fib b, c, numlength(c), termnum+1
  end

  defp numlength(n), do: n |> to_string |> String.length

end
