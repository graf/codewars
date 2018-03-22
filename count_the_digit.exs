ExUnit.start                                # set up the test runner

defmodule Countdigit do
  
  def nb_dig(0, 0), do: 1 
  
  def nb_dig(0, _), do: 0

  def nb_dig(1, 1), do: 1 + nb_dig(0, 1)
  
  def nb_dig(1, d), do: 0 + nb_dig(0, d)
  
  def nb_dig(n, d) do
    Enum.count(String.split(Integer.to_string(n*n), ""), fn(c) -> c == Integer.to_string(d) end) + nb_dig(n-1, d)
  end  
end

defmodule CountdigitTest do
  
  use ExUnit.Case

  defp testing(numtest, num, d, ans) do 
    IO.puts("Test #{numtest}")
    assert Countdigit.nb_dig(num, d) == ans
  end
  test "nb_dig" do 
    testing(-1, 0, 5, 0)
    testing(0, 10, 1, 4)
    testing(1, 5750, 0, 4700)
		testing(2, 11011, 2, 9481)
		testing(3, 12224, 8, 7733)
		testing(4, 11549, 1, 11905)
  end
end
