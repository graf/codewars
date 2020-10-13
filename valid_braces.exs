defmodule Challenge do
  def validate(_, balance) when balance < 0, do: false
  def validate([], balance) when balance > 0, do: false 
  def validate([], balance) when balance == 0, do: true
  def validate(["("|[h | t]], _) when h in ["]", "}"], do: false
  def validate(["{"|[h | t]], _) when h in [")", "]"], do: false
  def validate(["["|[h | t]], _) when h in [")", "}"], do: false
 
  def validate([h|t], balance) when h in ["(", "{", "["], do: validate(t, balance + 1)
  def validate([h|t], balance) when h in [")", "}", "]"], do: validate(t, balance - 1)
  
  def validate([h|t], balance), do: validate(t, balance)
  def validate(str), do: validate(str, 0)
  
  def valid_braces(braces) do
    braces
    |> String.graphemes
    |> validate
  end
end

