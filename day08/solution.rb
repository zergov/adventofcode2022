def visible?(map, i, j)
  tree_height = map[i][j]
  height = map.size - 1
  width = map.first.size - 1

  return true if i <= 0 || i >= height || j <= 0 || j >= width

  top   = (0..(i-1)).map      { |ii| map[ii][j] }.max || 0
  down  = ((i+1)..height).map { |ii| map[ii][j] }.max || 0
  left  = (0..(j-1)).map      { |jj| map[i][jj] }.max || 0
  right = ((j+1)..width).map  { |jj| map[i][jj] }.max || 0

  top < tree_height || down < tree_height || left < tree_height || right < tree_height
end

def count_trees(target_tree, trees)
  score = 0
  trees.each do |tree_height|
    if target_tree > tree_height
      score += 1
      next
    end

    if target_tree <= tree_height
      score += 1
      break
    end
  end

  score
end

def scenic_score(map, i, j)
  target_tree = map[i][j]
  height = map.size - 1
  width = map.first.size - 1

  top   = (0..(i-1)).map      { |ii| map[ii][j] }.reverse
  down  = ((i+1)..height).map { |ii| map[ii][j] }
  left  = (0..(j-1)).map      { |jj| map[i][jj] }.reverse
  right = ((j+1)..width).map  { |jj| map[i][jj] }

  top   = count_trees(target_tree, top)
  down  = count_trees(target_tree, down)
  left  = count_trees(target_tree, left)
  right = count_trees(target_tree, right)

  top * down * left * right
end

map = File.readlines("input")
  .map(&:strip)
  .map { |line| line.chars.map(&:to_i) }

visible = 0
best_score = 0
map.each_with_index do |row, i|
  row.each_with_index do |_, j|
    visible += 1 if visible?(map, i, j)
    best_score = [best_score, scenic_score(map, i, j)].max
  end
end

p "part_1: #{visible}"
p "part_2: #{best_score}"
