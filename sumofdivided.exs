ExUnit.start

defmodule Sumofdivided do
  def sum_of_divided(lst) do
    Enum.reduce(lst, %{}, fn (num, result) ->
      Enum.reduce(Enum.uniq(factors(num)), result, fn (prime, result) ->
        sum = Map.get(result, prime, 0)
        Map.put(result, prime, sum + num)
      end)
    end)
    |> Map.to_list
    |> Enum.sort
  end

  def factors(n), do: factors(abs(n), 2, [])
  def factors(n, k, f) when k * k > n, do: [n | f]
  def factors(n, k, f) when rem(n, k) == 0, do: factors(div(n, k), k, [k | f])
  def factors(n, k, f), do: factors(n, k + 1, f)
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
