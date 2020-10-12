defmodule ParenthesesValidator do
  def validate(_, balance) when balance < 0, do: false 
  def validate([], balance) when balance > 0, do: false 
  def validate([], balance) when balance == 0, do: true
  def validate([h|t], balance) when h == 40, do: validate(t, balance + 1)
  def validate([h|t], balance) when h == 41, do: validate(t, balance - 1)
  def validate([h|t], balance), do: validate(t, balance)
  def validate(list), do: validate(list, 0)
  
  def valid_parentheses(string) do
    string
    |> String.to_charlist
    |> validate
  end
end

