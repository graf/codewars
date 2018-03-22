ExUnit.start

defmodule Solution do
  def is_valid_ip("0.0.0.0"), do: true

  def ip_4?(nums), do: length(nums) == 4
  def number?(num) do
    len = String.length(num)
    Regex.match?(~r/^\d{1,3}\z/, num) && ((len == 1) || (len > 1 && String.first(num) != "0"))
  end
  def byte?(num) do 
    {int, tail} = Integer.parse(num)
    int < 256 && int >= 0
  end

  def is_valid_ip(ip) do
    nums = String.split(ip, ".")
    ip_4?(nums) && Enum.all?(nums, fn num -> number?(num) && byte?(num) end)
  end
end


defmodule TestSolution do
  use ExUnit.Case

  @ips [{"12.255.56.1",true},
        {"",false},
        {"abc.def.ghi.jkl",false},
        {"123.456.789.0",false},
        {"12.34.56",false},
        {"12.34.56 .1",false},
        {"12.34.56.-1",false},
        {"123.045.067.089",false},
        {"127.1.1.0",true},
        {"0.0.0.0",true},
        {"0.34.82.53",true},
        {"192.168.1.300",false}
  ]

  test "Test ip validity" do
    for {ip,result} <- @ips do
      IO.puts "Testing " <>ip
      assert Solution.is_valid_ip(ip) == result
    end
  end
end
