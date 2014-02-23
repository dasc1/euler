defmodule Fib do

    def genfib(_,b,tot,lim) when b >= lim do
        tot
    end

    def genfib(a,b,tot,lim) when rem(b,2) == 0 do
        genfib b, a+b, tot+b, lim 
    end

    def genfib(a,b,tot,lim) do
        genfib b, a+b, tot, lim 
    end

    def answer do
        genfib 1,1,0,4000000
    end
    
end
