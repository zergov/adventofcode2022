id = 0
elves = [0]

File.readlines("input").each do |line|
  if line == "\n"
    elves << 0
    id += 1
  else
    elves[id] += line.to_i
  end
end

winner_idx = elves.each_with_index.max[1]
puts "solution A"
puts "winner: #{winner_idx}"
puts "max calories: #{elves[winner_idx]}"

a, b, c, _ = elves.sort.reverse
puts ""
puts "solution B"
puts "answer: #{a + b + c}"
