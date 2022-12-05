def part_1
  pairs = File.readlines('input').map do |line|
    line
      .strip
      .split(",")
      .map { |pair| pair.split("-").map(&:to_i) }
      .map { |a, b| a..b }
  end

  pairs
    .filter { |a, b| a.cover?(b) || b.cover?(a) }
    .size
end

def part_2
  pairs = File.readlines('input').map do |line|
    line
      .strip
      .split(",")
      .map { |pair| pair.split("-").map(&:to_i) }
      .map { |a, b| a..b }
  end

  pairs
    .filter { |a, b| a.first <= b.last && b.first <= a.last }
    .size
end

p "part_1: #{part_1}"
p "part_2: #{part_2}"
