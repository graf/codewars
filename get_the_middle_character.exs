ExUnit.start

defmodule Challenge do
  def get_middle(str, len) when rem(len, 2) == 0 do 
    String.slice(str, div(len, 2) - 1, 2)
  end

  def get_middle(str, len) when rem(len, 2) == 1 do 
    String.at(str, div(len, 2))
  end

  def get_middle(str) do
    get_middle(str, String.length(str))
  end
end

defmodule TestSolution do
  use ExUnit.Case
  import Challenge, only: [get_middle: 1]
  
  test "basic tests" do
    assert get_middle("test") == "es"
    assert get_middle("testing") == "t"
  end
end
