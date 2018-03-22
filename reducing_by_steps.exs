ExUnit.start


defmodule Reducebystep do

  def som(a, b), do: a + b
  def mini(a, b), do: min(a, b)
  def maxi(a, b), do: max(a, b)

  def gcdi(a,0), do: abs(a)
  def gcdi(a,b), do: gcdi(b, rem(a,b))
 
  def lcmu(a,b), do: div(abs(a*b), gcdi(a,b))
  
  def oper_array(fct, arr, init), do: Enum.scan(arr, init, fct)
end


defmodule ReducebystepTest do
  
  use ExUnit.Case

  defp testing(numtest, fct, arr, init, ans) do 
    IO.puts("Test #{numtest}")
    assert Reducebystep.oper_array(fct, arr, init) == ans
  end
  test "oper_array" do 
    a = [ 18, 69, -90, -78, 65, 40 ]
    
    r = [ 18, 3, 3, 3, 1, 1 ]
    testing(1, &Reducebystep.gcdi/2, a, 18, r)
    r = [ 18, 414, 2070, 26910, 26910, 107640 ]
    testing(2, &Reducebystep.lcmu/2, a, 18, r)
    r = [ 18, 18, -90, -90, -90, -90 ]
    testing(4, &Reducebystep.mini/2, a, 18, r)
    r = [ 18, 87, -3, -81, -16, 24 ]
    testing(3, &Reducebystep.som/2, a, 0, r)
    r = [ 18, 69, 69, 69, 69, 69 ]
    testing(5, &Reducebystep.maxi/2, a, 18, r)
    
    a = [53, 83, 54, -58, -20, 56, 57, 10]
    r = [53, 4399, 237546, 6888834, 68888340, 964436760, 18324298440, 18324298440]
    testing(200, &Reducebystep.lcmu/2, a, 53, r) 
  end
end
