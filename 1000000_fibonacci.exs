defmodule Fib do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(2), do: 1  
  def fib(n) when n < 0 and rem(-n, 2) != 0, do: fib(-n)   
  def fib(n) when n < 0, do: -fib(-n)   
  def fib(n) do    
    fibonacchi(n, 1, 1, 0, 1, 0)
  end
  def fibonacchi(0, a, b, c, x, y), do: y
  def fibonacchi(n, a, b, c, x, y) when rem(n, 2) == 0 do
    fibonacchi(div(n, 2), (a * a + b * b), (a * b + b * c), (b * b + c * c), x, y)
  end
  def fibonacchi(n, a, b, c, x, y) do
    fibonacchi(n - 1, a, b, c, (a * x + b * y), (b * x + c * y))
  end
end
