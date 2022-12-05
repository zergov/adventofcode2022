def original_stacks
  [
    ["T","V","J","W","N","R","M","S"],
    ["V","C","P","Q","J","D","W","B"],
    ["P","R","D","H","F","J","B"],
    ["D","N","M","B","P","R","F"],
    ["B","T","P","R","V","H"],
    ["T","P","B","C"],
    ["L","P","R","J","B"],
    ["W","B","Z","T","L","S","C","N"],
    ["G","S","L"],
  ].map(&:reverse)
end

def test_stacks
  [
    ["Z", "N"],
    ["M", "C", "D"],
    ["P"],
  ]
end

def part_1(stacks)
  File.readlines("input").each do |instruction|
    n, from, to = instruction.scan(/\d+/).map(&:to_i)

    source = stacks[from - 1]
    destination = stacks[to - 1]

    n.times do
      destination << source.pop unless source.empty?
    end
  end

  stacks.map(&:last).join("")
end

def part_2(stacks)
  File.readlines("input").each do |instruction|
    n, from, to = instruction.scan(/\d+/).map(&:to_i)

    source = stacks[from - 1]
    destination = stacks[to - 1]

    stacks[to - 1] = destination + source.pop(n)
  end

  stacks.map(&:last).join("")
end

puts "part_1: #{part_1(original_stacks)}"
puts "part_2: #{part_2(original_stacks)}"
