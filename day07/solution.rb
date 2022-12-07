def build_fs
  fs = {"/" => {}}
  pwd = ["/"]

  File.readlines("input").map(&:strip).each do |line|
    if line.start_with?("$")
      command, path = line.split(" ").drop(1)

      if command == "cd"
        case path
        when "/"
          pwd = ["/"]
        when ".."
          pwd.pop
        else
          pwd << path
        end
      end
    elsif line.start_with?("dir")
      dir = line.split(" ").last
      fs.dig(*pwd)[dir] = {}
    else
      size, filename = line.split(" ")
      fs.dig(*pwd)[filename] = size.to_i
    end
  end

  fs
end

def dir_sizes(fs, results)
  files = fs.filter { |f, v| Integer === v }
  dirs = fs.filter { |f, v| Hash === v }

  size = files.values.sum

  dirs.each do |dir, fss|
    size += dir_size = dir_sizes(fss, results)
    results << dir_size
  end

  size
end

def part_1
  results = []
  dir_sizes(build_fs, results)

  results.filter { |size| size < 100000 }.sum
end

def part_2
  results = []
  dir_sizes(build_fs, results)

  dirs = results
  disk = 70000000
  required = 30000000
  available = disk - dirs.max
  target = required - available

  min = 9999999999999999999999999
  dirs.each do |size|
    if size > target && size < min
      min = size
    end
  end

  min
end

p "part_1: #{part_1}"
p "part_2: #{part_2}"
