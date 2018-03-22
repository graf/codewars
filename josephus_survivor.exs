ExUnit.start

defmodule Josephus do
  def survivor([n], _, _) when length([n]) == 1 do
    n
  end

  def survivor(arr, i, k) do
    survivor(List.delete_at(arr, i), rem(i + k - 1, length(arr) - 1), k)
  end
  
  def survivor(n, k) do
    survivor(Enum.to_list(1..n), rem(k - 1, n), k)
  end
end

defmodule TestSolution do
  use ExUnit.Case
  
  # TODO: Replace examples and use TDD development by writing your own tests
  test "some test description" do
    assert Josephus.survivor(7, 3) == 4
    assert Josephus.survivor(11, 19) == 10
    assert Josephus.survivor(1, 300) == 1
    assert Josephus.survivor(14, 2) == 13
    assert Josephus.survivor(100, 1) == 100
  end
end
