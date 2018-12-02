ExUnit.start

defmodule Fib do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(2), do: 1
  def fib(n), do: fib(n-2) + fib(n-1)
end


defmodule FibTest do
  
  use ExUnit.Case

  test "fib" do
    assert Fib.fib(0) == 0
    assert Fib.fib(1) == 1
    assert Fib.fib(2) == 1
    assert Fib.fib(3) == 2
    assert Fib.fib(4) == 3
    assert Fib.fib(5) == 5
    assert Fib.fib(6) == 8
  end
end
