ExUnit.start

defmodule Kata do
  def permutations(_, left, right) when right < left or left < 0, do: [[]]
  def permutations(out, left, right) when left == 0 and right == 0, do: [out]
  def permutations(out, left, right) when left > 0 or right > left do
    permutations(out ++ ["("], left - 1, right) ++ permutations(out ++ [")"], left, right - 1)
  end

  def balanced_parens(n) do
    permutations([], n, n)
    |> Enum.filter(fn arr -> length(arr) == 2*n end )
    |> Enum.map(&Enum.join/1)
  end
end

defmodule TestSuite do
    use ExUnit.Case

    def solution_check(n,r) do
        user = Kata.balanced_parens(n)
        assert Enum.sort(user) == Enum.sort(r)
    end
  

    test "0" do solution_check(0,[""]) end
    test "1" do solution_check(1,["()"]) end
    test "2" do solution_check(2,["(())","()()"]) end
    test "3" do solution_check(3,["((()))","(()())","(())()","()(())","()()()"]) end
    test "4" do solution_check(4,["(((())))","((()()))","((())())","((()))()","(()(()))","(()()())","(()())()","(())(())","(())()()","()((()))","()(()())","()(())()","()()(())","()()()()"]) end
end

