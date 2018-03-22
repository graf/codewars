ExUnit.start

defmodule Codewars do
  def remove_exclamation_marks(s) do
    String.replace(s, "!", "")
  end
end

defmodule TestSolution do
  use ExUnit.Case

  test "Basic Tests" do
    assert Codewars.remove_exclamation_marks("Hello World!") == "Hello World"
    assert Codewars.remove_exclamation_marks("Hello World!!!") == "Hello World"
    assert Codewars.remove_exclamation_marks("Hi! Hello!") == "Hi Hello"
    assert Codewars.remove_exclamation_marks("") == ""
    assert Codewars.remove_exclamation_marks("Oh, no!!!") == "Oh, no"
  end
end
