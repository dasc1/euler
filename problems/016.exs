defmodule X do

  def answer do
    pow = power(2, 1000) # :math.pow(2,1000)
    sumdigits pow
  end
  def power(n, 1), do: n
  def power(n, x), do: n * power(n, x-1)
  def sumdigits(n) when n < 10, do: n
  def sumdigits(n) do
    sumdigits(div(n,10)) + sumdigits(rem(n,10))
  end

end
