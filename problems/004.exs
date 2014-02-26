defmodule X do

  def solve004 do
    solve_down(999)
  end

  defp solve_down(num) do
    range = Enum.to_list 100..num
    z = lc x inlist range, y inlist range, do: x * y
    Enum.filter(z, &is_palindrome?/1)
    |> Enum.max
  end
  def is_palindrome?(num) do
    str = to_string num
    str == String.reverse(str)
  end

end
