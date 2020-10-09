defmodule Kata do
  def clean_list([], out), do: out
  def clean_list([a|t], []) when a == 35, do: clean_list(t, [])
  def clean_list([a|t], out) when a == 35, do: clean_list(t, tl(out))
  def clean_list([a|t], out), do: clean_list(t, [a] ++ out)
  
  def clean_string(s) do
    String.to_charlist(s)
    |> clean_list([])
    |> Enum.reverse
    |> List.to_string
  end
end

