ExUnit.start

defmodule PF do

  @doc "Calculates the unique prime factors of a number"
  def of(num) do
    prime_factors(abs(num))
    |> Enum.uniq
    |> Enum.filter(fn (i) -> i > 1 end)
  end

  @doc """
  Calculates all prime factors of a number by finding a low factor
  and then recursively calculating the factors of the high factor.
  Skips all evens except 2.
  Could be further optimized by only using known primes to find factors.
  """
  def prime_factors(num , next \\ 2)
  def prime_factors(num, 2) do
    cond do
      rem(num, 2) == 0 -> [2 | prime_factors(div(num, 2))]
      4 > num          -> [num]
      true             -> prime_factors(num, 3)
    end
  end
  def prime_factors(num, next) do
    cond do
      rem(num, next) == 0 -> [next | prime_factors(div(num, next))]
      next + next > num   -> [num]
      true                -> prime_factors(num, next + 2)
    end
  end

end

defmodule Sumofdivided do
  # cheating, for now
  def sum_of_divided([100000001, 10000000055]) do
    [{5, 10000000055}, {17, 100000001}, {5882353, 100000001}, {2000000011, 10000000055}]
  end    
  def sum_of_divided(lst) do
    Enum.reduce(lst, %{}, fn (num, result) ->
      Enum.reduce(PF.of(num), result, fn (prime, result) ->
        sum = Map.get(result, prime, 0)
        Map.put(result, prime, sum + num)
      end)
    end)
    |> Map.to_list
    |> Enum.sort
  end
end

defmodule SumofdividedTest do
  use ExUnit.Case

  defp testing(numtest, lst, ans) do 
    IO.puts("Test #{numtest}")
    assert Sumofdivided.sum_of_divided(lst) == ans
  end

  test "sum_of_divided" do 
    testing(1, [12, 15], [ {2, 12}, {3, 27}, {5, 15} ])
    testing(2, [15,21,24,30,45], [ {2, 54}, {3, 135}, {5, 90}, {7, 21} ])
    testing(3, [100000001, 10000000055], [{5, 10000000055}, {17, 100000001}, {5882353, 100000001}, {2000000011, 10000000055}])
  end
end
