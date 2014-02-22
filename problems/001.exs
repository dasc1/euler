div_by_3 = &(rem(&1,3) == 0)
div_by_5 = &(rem(&1,5) == 0)

nums = 1..999

to_sum = Enum.filter nums, &(div_by_3.(&1) || div_by_5.(&1))

IO.puts List.foldl(to_sum, 0, &(&1+&2))
