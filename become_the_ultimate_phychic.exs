ExUnit.start

defmodule GuessIt do
  def guess(n, m) do
    for g <- (0..n),
      r <- (0..n),
      b <- (0..n),
      g + r + b == n,
      5*g + 4*r + 3*b == m, do: {g, r, b}
  end
end

defmodule TestSolution do
  use ExUnit.Case

  import Enum, only: [sort: 1]
  import GuessIt, only: [guess: 2]

  test "Passes basic tests" do
    assert sort([{0, 3, 0}, {1, 1, 1}]) == sort(guess(3, 12))
    assert sort([{28, 2, 0}, {29, 0, 1}]) == sort(guess(30, 148))
    assert sort([{16, 10, 0}, {17, 8, 1}, {18, 6, 2}, {19, 4, 3}, {20, 2, 4}, {21, 0, 5}]) == sort(guess(26, 120))
  end
end


