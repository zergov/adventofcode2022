def priority(item)
  if item == item.upcase
    item.ord - ('A'.ord - 1) + 26
  else
    item.ord - ('a'.ord - 1)
  end
end

def part_1
  File.readlines('input')
    .map { |line| line.strip.chars }
    .map do |items|
      compartment_a = items.take(items.size / 2)
      compartment_b = items.drop(items.size / 2)

      (compartment_a & compartment_b).first
    end
    .sum { |item| priority(item) }
end

def part_2
  File.foreach('input')
    .each_slice(3)
    .map { |group| group.map { |bag| bag.strip.chars } }
    .map { |a, b, c| (a & b & c).first }
    .sum { |badge| priority(badge) }
end

puts "part 1: #{part_1}"
puts "part 2: #{part_2}"
