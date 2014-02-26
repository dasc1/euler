defmodule X do

  def solve003, do: findbiggest(600851475143, 2)

  defp findbiggest(bignum, try) when bignum == try, do: bignum
  defp findbiggest(bignum, try) when rem(bignum, try) == 0 do
    findbiggest(div(bignum, try), try)
  end
  defp findbiggest(bignum, try), do: findbiggest(bignum, try+1)

end
