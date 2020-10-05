defmodule Kata do
  def count_patterns_from(_, 0), do: 0
  def count_patterns_from(_, 1), do: 1
  def count_patterns_from(_, len) when len > 9, do: 0
  def count_patterns_from(letter, len) do
    paths([letter], path(letter, [letter]), len - 1)
    |> flatten(len - 1)
    |> length
  end
  
  def flatten([], _), do: []
  def flatten(arr, 1), do: arr
  def flatten([h|t], depth), do: flatten(h, depth - 1) ++ flatten(t, depth)
  
  def paths(pattern, _, 0), do: pattern

  def paths(pattern, paths, len) do
    Enum.map(paths, fn l -> paths(pattern ++ [l], path(l, pattern), len - 1) end)
  end
  
  def smart_path(direct, passthrough, used) do
    extra = Enum.filter(passthrough, fn ([direct | _ ]) -> 
      Enum.member?(used, direct)
    end)
    |> Enum.map(fn ([_ | [passthrough | _]]) -> passthrough end) 
    Enum.uniq(extra ++ direct) -- used    
  end

  def path("A", pattern) do
    smart_path(["B", "D", "E", "F", "H"], [["B", "C"], ["E", "I"], ["D", "G"]], pattern)
  end
  
  def path("B", pattern) do
    smart_path(["A", "C", "F", "E", "D", "I", "G"], [["E", "H"]], pattern)
  end
  
  def path("C", pattern) do
    smart_path(["B", "E", "F", "H", "D"], [["E", "G"], ["F", "I"], ["B", "A"]], pattern)
  end
  
  def path("D", pattern) do
    smart_path(["A", "B", "E", "H", "G", "C", "I"], [["E", "F"]], pattern)
  end
  
  def path("E", pattern) do
    smart_path(["A", "B", "C", "F", "I", "H", "G", "D"], [], pattern)
  end
  
  def path("F", pattern) do
    smart_path(["A", "B", "C", "E", "G", "H", "I"], [["E", "D"]], pattern)
  end
  
  def path("G", pattern) do
    smart_path(["B", "D", "E", "F", "H"], [["D", "A"], ["H", "I"], ["E", "C"]], pattern)
  end
    
  def path("H", pattern) do
    smart_path(["A", "C", "D", "E", "F", "G", "I"], [["E", "B"]], pattern)
  end
   
  def path("I", pattern) do
    smart_path(["B", "D", "E", "F", "H"], [["H", "G"], ["E", "A"], ["F", "C"]], pattern)
  end
end

