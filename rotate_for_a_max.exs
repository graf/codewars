ExUnit.start

defmodule Maxrot do
  def rot([n]), do: [n]
  def rot([n0, n1 | tail] = digits), do: max(digits, [n1 | rot(tail ++ [n0])])  
 
  def max_rot(num) do
    num
    |> Integer.digits
    |> rot           
    |> Integer.undigits    
  end
end

defmodule MaxrotTest do
  
  use ExUnit.Case

  defp testMaxrot(numtest, num, ans) do 
    IO.puts("Test #{numtest}")
    assert Maxrot.max_rot(num) == ans
  end
  
  test "max_rot" do 
        testMaxrot 0, 56789, 68957
        testMaxrot 1, 38458215, 85821534
        testMaxrot 2, 195881031, 988103115
        testMaxrot 3, 896219342, 962193428
        testMaxrot 4, 69418307, 94183076
        testMaxrot 5, 257117280, 571172802
        testMaxrot 6, 240522578, 452782025
        testMaxrot 7, 561656824, 666824515
        testMaxrot 8, 672963486, 796348662
        testMaxrot 9, 48192242, 89242412
        testMaxrot 10, 25053359, 55392035
  end  
end
