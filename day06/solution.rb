def part_1
  buffer = []
  File.read('input').strip.chars.each_with_index do |char, i|
    buffer << char
    buffer.shift if buffer.size > 4

    if buffer.size == 4 && buffer.uniq.size == buffer.size
      return i + 1
    end
  end
end

def part_2
  buffer = []
  File.read('input').strip.chars.each_with_index do |char, i|
    buffer << char
    buffer.shift if buffer.size > 14

    if buffer.size == 14 && buffer.uniq.size == buffer.size
      return i + 1
    end
  end
end

p "part_1: #{part_1}"
p "part_2: #{part_2}"
