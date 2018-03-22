ExUnit.start

defmodule RecreationOne do
  def factor(1), do: [1]
  def factor(n) do
    (for i <- 1..div(n,2), rem(n,i)==0, do: i) ++ [n]
  end

  # Recursive (faster version);
  def divisor(n), do: divisor(n, 1, []) |> Enum.sort

  defp divisor(n, i, factors) when n < i*i    , do: factors
  defp divisor(n, i, factors) when n == i*i   , do: [i | factors]
  defp divisor(n, i, factors) when rem(n,i)==0, do: divisor(n, i+1, [i, div(n,i) | factors])
  defp divisor(n, i, factors)                 , do: divisor(n, i+1, factors)

  def magic?(m) do
    s = Enum.sum(Enum.map(divisor(m), fn x -> x*x end))
    r = Float.round(:math.sqrt(s))
    if r*r == s do
      [{ m, s }]
    else
      []
    end
  end

  def list_squared(m, m) do
    magic?(m)
  end

  def list_squared(m, n) when m < n do
    list_squared(m, n-1) ++ magic?(n)
  end
end

defmodule TestSolution do
  use ExUnit.Case

  test "Example Tests" do
    assert RecreationOne.list_squared(1, 250) == [{1, 1}, {42, 2500}, {246, 84100}]
    assert RecreationOne.list_squared(42, 250) == [{42, 2500}, {246, 84100}]
    assert RecreationOne.list_squared(250, 500) == [{287, 84100}]
  end
end
