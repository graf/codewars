ExUnit.start


defmodule Encryptor do

  defp encode_char(ch, n) when ch in ?a..?z do
    rem((ch - ?a + n), 26) + ?a
  end

  defp encode_char(ch, n) when ch in ?A..?Z do
    rem((ch - ?A + n), 26) + ?A
  end

  defp encode_char(ch, _), do: ch

  def rot13(string, n \\ 13) do
    to_charlist(string)
      |> Enum.map(&encode_char(&1, n)) 
      |> List.to_string
  end
end


defmodule TestEncryptor do
  use ExUnit.Case
  import Encryptor, only: [rot13: 1]

  test "test" do
    assert "grfg" == rot13("test"), "Input: test , Expected Output: grfg , Actual Output: #{rot13("test")}"
  end
  
  test "Test" do
    assert "Grfg" == rot13("Test"), "Input: Test , Expected Output: Grfg , Actual Output: #{rot13("Test")}"
  end
end
