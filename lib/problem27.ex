defmodule Problem27 do

  def answer do
    lim = 999
    avals = Enum.filter(-lim..lim, &(rem(&1, 2)!=0))
    bvals = Xprimes.primes_to lim
    primelist = Xprimes.primes_to 1414
    (lc a inlist avals, b inlist bvals,
      do: number_of_primes(a, b, primelist))
    |> Enum.max_by(fn x -> elem x, 2 end)
    |> prodcoef
    |> IO.puts
  end

  defp prodcoef({a,b,_}), do: a * b

  defp number_of_primes(a, b, primelist), do: _nop(a,b,primelist,-1, true)
  defp _nop(a, b, _primelist, num, false), do: {a, b, num-1}
  defp _nop(a, b, primelist, num, true) do
    x = num+1
    primecand = x * x + a * x + b
    pcprime = is_prime?(primecand, primelist)
    _nop(a, b, primelist, x, pcprime)
  end

  defp is_prime?(n, _primelist) when n < 2, do: false
  defp is_prime?(n, primelist),
    do: _is_prime?(n, :math.sqrt(n), primelist)
  defp _is_prime?(_n, lim, [h|_tail]) when h > lim, do: true
  defp _is_prime?(n, _lim, [h|_tail]) when rem(n, h) == 0, do: false
  defp _is_prime?(n, lim, [_h|tail]), do: _is_prime?(n, lim, tail)

end
