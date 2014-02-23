defmodule X do

    def condense([], primelist, _) do
        primelist
    end

    def condense([h | tail], primelist, lim) when h > lim do
        [h | primelist ++ tail]
    end

    def condense([h | tail], primelist, lim) do
        tail
        |> Enum.filter(&(rem(&1, h) != 0))
        |> condense([h | primelist], lim)
    end

    def generate_prime_list(top) do
        Enum.filter(2..top, (fn _ -> true end))
        |> condense([], :math.sqrt(top))
    end

    def xsum([], tot), do: tot
    def xsum([h|t], tot) do
       xsum(t, h+tot)
    end

end

IO.puts X.generate_prime_list(2000000)
|> X.xsum(0)

