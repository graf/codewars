defmodule Solution do
  def two_oldest_ages(ages) do
    ages
    |> Enum.sort    
    |> Enum.take(-2)          
  end
end
