ExUnit.start

defmodule ProdFib do
  def f(n, n1, prod) when n * n1 == prod, do: [n, n1, true]
  def f(n, n1, prod) when n * n1 > prod, do: [n, n1, false]
  def f(n, n1, prod), do: f(n1, n + n1, prod)

  def product_fib(prod) do
    f(0, 1, prod)
  end
end


defmodule ProdFibTest do

  use ExUnit.Case

  def dotest(n, exp) do
    IO.puts("Testing : #{n}")
    act = ProdFib.product_fib(n)
    IO.puts "#{inspect(act)}"
    IO.puts "#{inspect(exp)}"
    assert act == exp
    IO.puts("#")
  end

  test "product_fib" do
    dotest(4895, [55, 89, true])
    dotest(5895, [89, 144, false])
    dotest(74049690, [6765, 10946, true])
  end
end


