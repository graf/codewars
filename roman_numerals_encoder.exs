ExUnit.start

defmodule ArabicToRoman do
  def solution(number) when number >= 1000, do: 'M'  ++ solution(number - 1000)
  def solution(number) when number >= 900,  do: 'CM' ++ solution(number - 900)
  def solution(number) when number >= 500,  do: 'D'  ++ solution(number - 500)
  def solution(number) when number >= 400,  do: 'CD' ++ solution(number - 400)
  def solution(number) when number >= 100,  do: 'C'  ++ solution(number - 100)
  def solution(number) when number >= 90,   do: 'XC' ++ solution(number - 90)
  def solution(number) when number >= 50,   do: 'L'  ++ solution(number - 50)
  def solution(number) when number >= 40,   do: 'XL' ++ solution(number - 40)
  def solution(number) when number >= 10,   do: 'X'  ++ solution(number - 10)
  def solution(number) when number >= 9,    do: 'IX' ++ solution(number - 9)
  def solution(number) when number >= 5,    do: 'V'  ++ solution(number - 5)
  def solution(number) when number >= 4,    do: 'IV' ++ solution(number - 4)
  def solution(number) when number >= 1,    do: 'I'  ++ solution(number - 1)
  def solution(0),                          do: []
end

defmodule TestArabicToRoman do
  use ExUnit.Case

  test "converts from arabic to roman" do
    assert ArabicToRoman.solution(0) == []
    assert ArabicToRoman.solution(1) == 'I'
    assert ArabicToRoman.solution(2) == 'II'
    assert ArabicToRoman.solution(3) == 'III'
    assert ArabicToRoman.solution(4) == 'IV'
    assert ArabicToRoman.solution(5) == 'V'
    assert ArabicToRoman.solution(6) == 'VI'
    assert ArabicToRoman.solution(7) == 'VII'
    assert ArabicToRoman.solution(9) == 'IX'
  end
end
