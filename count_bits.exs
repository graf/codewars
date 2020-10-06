defmodule CountBits do
  def bits(n) do
    Integer.to_charlist(n, 2)
    |> Enum.count(fn c -> c == 49 end)
  end
end
