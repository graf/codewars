ExUnit.start

defmodule Aretheythesame do
  def comp([], []), do: true
  def comp(a, b) when length(a) != length(b), do: false
  def comp(a, b) do
    length(Enum.map(a, fn x -> x*x end) -- b) == 0
  end
end

defmodule AretheythesameTest do
  
  use ExUnit.Case

  test "Are they the Same" do
    IO.puts("Test 1")
    a = [121, 144, 19, 161, 19, 144, 19, 11]
    b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]
    assert Aretheythesame.comp(a, b) == true
    IO.puts("Test 2")
    assert Aretheythesame.comp([121, 144, 19, 161, 19, 144, 19, 11], 
      [11*21, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) == false
  end
end


