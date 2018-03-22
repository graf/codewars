ExUnit.start

defmodule Codewars do
  def even_or_odd(number) when rem(number, 2) == 1, do: "Odd"
  def even_or_odd(_), do: "Even"
end

defmodule TestSolution do
  use ExUnit.Case
  
  test "basic" do
    assert Codewars.even_or_odd(2) == "Even"
    assert Codewars.even_or_odd(0) == "Even"
    assert Codewars.even_or_odd(7) == "Odd"
    assert Codewars.even_or_odd(1) == "Odd"
  end
end
