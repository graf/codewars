ExUnit.start

defmodule Maxsumdig do

  def check_num(num, maxsm) do
    digits = Integer.digits(num)
    chunks = Enum.chunk_every(digits, 4, 1, :discard)
    Enum.all?(chunks, fn chunk -> Enum.sum(chunk) <= maxsm end )
  end
  
  def max_sum_dig(nmax, maxsm) do
    numbers = Enum.filter(1000..nmax, fn x -> Maxsumdig.check_num(x, maxsm) end)
    len = length(numbers)
    sum = Enum.sum(numbers)
    mean = 1.0 * sum / len
    mid = Enum.min_by(numbers, fn x -> abs(mean - x) end)
    [len, mid, sum]
  end
  
end


defmodule MaxsumdigTest do
  
  use ExUnit.Case

  defp testing(nmax, mxsm, ans) do 
    assert Maxsumdig.max_sum_dig(nmax, mxsm) == ans
  end
  
  test "max_sum_dig" do 
    IO.puts("Test 1")
    testing(2000, 3, [11, 1110, 12555])
    IO.puts("Test 2")
    testing(2000, 4, [21, 1120, 23665])
    IO.puts("Test 3")
    testing(2000, 7, [85, 1200, 99986])
    IO.puts("Test 4")
    testing(3000, 7, [141, 1600, 220756])
    IO.puts("Test 5")
    testing(4000, 4, [35, 2000, 58331])
    IO.puts("Test 6")
    testing(50000, 9, [2538, 20000, 50663941])
    IO.puts("Test 7")
    testing(17783, 2, [14, 10000, 98337])
  end
  
end


