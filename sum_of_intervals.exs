defmodule Kata do
  def sum_of_intervals(intervals) do
    arr = Enum.map(intervals, fn i -> Enum.to_list((elem(i,0)..(elem(i,1)-1))) end)
    arr = List.flatten(arr)
    arr = Enum.uniq(arr)
    length(arr)
  end
end
