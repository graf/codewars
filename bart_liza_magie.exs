ExUnit.start

defmodule People do

  def list([]) do
    ""
  end

  def list([p]) do
    p[:name]
  end

  def list([head, tail]) do
    "#{head[:name]} & #{tail[:name]}"
  end

  def list([head | tail]) do
    "#{head[:name]}, #{list(tail)}"
  end
end

defmodule TestPeople do
  use ExUnit.Case
  import People, only: [list: 1]

  test "basic tests" do
    assert list([]) == ""
    assert list([%{name: "Bart"}]) == "Bart"
    assert list([%{name: "Bart"},%{name: "Lisa"}]) == "Bart & Lisa"
    assert list([%{name: "Bart"},%{name: "Lisa"},%{name: "Maggie"}]) == "Bart, Lisa & Maggie"
    assert list([%{name: "Bart"},%{name: "Lisa"},%{name: "Maggie"},%{name: "Homer"},%{name: "Marge"}]) == "Bart, Lisa, Maggie, Homer & Marge"
  end
end
