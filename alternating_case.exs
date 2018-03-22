ExUnit.start                                # set up the test runner

defmodule Codewars.StringUtils do
  def alter_char_case(char) do
    down_char = String.downcase(char)
    if char == down_char do
      String.upcase(char)
    else
      down_char
    end
  end

  def alter_case(str) do
    Enum.map_join(String.split(str, ""), "", fn(c) -> alter_char_case(c) end)
  end
end

defmodule Codewars.TestStringUtils do
  use ExUnit.Case
  import Codewars.StringUtils, only: [alter_case: 1]

  test "basic cases" do
    assert alter_case("hello world") == "HELLO WORLD"
    assert alter_case("HELLO WORLD") == "hello world"
    assert alter_case("hello WORLD") == "HELLO world"
    assert alter_case("HeLLo WoRLD") == "hEllO wOrld"
    assert alter_case("12345") == "12345" # Non-alphabetical characters are unaffected
    assert alter_case("1a2b3c4d5e") == "1A2B3C4D5E"
    assert alter_case("StringUtils.toAlternatingCase") == "sTRINGuTILS.TOaLTERNATINGcASE"
    assert alter_case(alter_case("Hello World")) == "Hello World" # When method is called twice, should return original string
  end
end
