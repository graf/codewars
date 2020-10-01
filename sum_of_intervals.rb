def sum_of_intervals(intervals)
  arr = intervals.map do |i|
    (i[0]...i[-1]).to_a
  end
  arr.flatten!
  arr.uniq!
  arr.length
end
