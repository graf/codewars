defmodule Magnet do
  def v(k, n), do: 1.0 / (k*:math.pow(n+1, 2*k))
  def u(k, maxn), do: Enum.reduce((1..maxn), 0, fn n, sum -> v(k, n) + sum end)  
  def s(maxk, maxn), do: Enum.reduce((1..maxk), 0, fn k, sum -> u(k, maxn) + sum end)  

  def doubles(maxk, maxn) do
    s(maxk, maxn)
  end
end

