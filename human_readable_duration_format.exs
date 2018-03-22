ExUnit.start

defmodule DurationFormatter do
  def format_duration(0) do
    "now"
  end

  def join([s]), do: "#{s}"
  def join([s1, s0]), do: "#{s1} and #{s0}"
  def join([s2 | tail]), do: "#{s2}, #{join(tail)}"

  def format(0, _), do: ""
  def format(1, unit), do: "1 #{unit}"
  def format(v, unit), do: "#{v} #{unit}s"

  def format_duration(seconds) do
    [format(div(seconds, 3600*24*365), 'year'),
     format(rem(div(seconds, 3600*24), 365), 'day'),
     format(rem(div(seconds, 3600), 24), 'hour'),
     format(rem(div(seconds, 60), 60), 'minute'), 
     format(rem(seconds, 60), 'second')]
     |> Enum.filter(fn s -> String.length(s) > 0 end)
     |> join
  end
end

defmodule TestDurationFormatter do
  use ExUnit.Case
  import DurationFormatter, only: [format_duration: 1]

  test "format_duration" do
    assert format_duration(1) == "1 second"
    assert format_duration(62) == "1 minute and 2 seconds"
    assert format_duration(120) == "2 minutes"
    assert format_duration(3600) == "1 hour"
    assert format_duration(3662) == "1 hour, 1 minute and 2 seconds"
  end
end


