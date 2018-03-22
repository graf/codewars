ExUnit.start

defmodule StringUtils do
  def digit?(s) do
    Regex.match?(~r/^\d\z/, s)
  end
end


defmodule TestStringUtils do
  use ExUnit.Case
  import StringUtils, only: [digit?: 1]

  test "basic cases" do
    assert digit?("") == false
    assert digit?("7") == true
    assert digit?("\n1") == false
    assert digit?("1\n") == false
    assert digit?(" ") == false
    assert digit?("a") == false
    assert digit?("a5") == false
    assert digit?("14") == false
  end
end
