ExUnit.start

defmodule Solution do
  def dec(?M), do: 1000
  def dec(?D), do: 500
  def dec(?C), do: 100
  def dec(?L), do: 50
  def dec(?X), do: 10
  def dec(?V), do: 5
  def dec(?I), do: 1

  def decode([]), do: 0
  def decode([x]), do: dec(x)
  def decode([c1, c2 | tail]) do
    case {dec(c1), dec(c2)} do
      {v1, v2} when v1 < v2 -> v2 - v1 + decode(tail)
      {v1, v1} -> v1 + v1 + decode(tail)
      {v1, _}  -> v1 + decode([c2 | tail])
    end
  end
  def decode(roman) do
    decode(to_charlist(roman))
  end
end

defmodule TestSolution do
  use ExUnit.Case

  test "should equals 21" do
    assert Solution.decode("XXI") == 21
  end
  test "should equals 1" do
    assert Solution.decode("I") == 1
  end
  test "should equals 4" do
    assert Solution.decode("IV") == 4
  end
  test "should equals 2008" do
    assert Solution.decode("MMVIII") == 2008
  end
  test "should equals 1666" do
    assert Solution.decode("MDCLXVI") == 1666
  end
end
