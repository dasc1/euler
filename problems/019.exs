defmodule X do

  # 1 jan 1900 = monday (1)
  # 1 jan 1901 = tuesday (2) = rem(1+365, 7) since 1900 isn't leap

  def answer do
    0..1198 # 1199 increments
    |> Enum.to_list
    |> Enum.map(&oset/1)
    |> Enum.reduce([2], fn (e, acc = [ah|_at]) -> [rem(e+ah, 7)|acc] end)
    |> Enum.filter(&(&1 == 0))
    |> Enum.count
  end

  def oset(x) do
    base = Enum.at([3,0,3,2,3,2,3,3,2,3,2,3], rem(x,12)) # jan - dec
    base + if rem(x,48) == 37 do 1 else 0 end
  end

end
