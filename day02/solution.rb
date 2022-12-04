oponent_hands = {"A" => :rock, "B" => :paper, "C" => :scisor}
player_hands  = {"X" => :rock, "Y" => :paper, "Z" => :scisor}


def rock_paper_scisor(player_a, player_b)
  return 3 if player_a == player_b

  win_score  = 6
  lose_score = 0

  case player_a
  when :rock
    player_b == :scisor ? win_score : lose_score
  when :paper
    player_b == :rock ? win_score : lose_score
  when :scisor
    player_b == :paper ? win_score : lose_score
  end
end

def hand_for_outcome(hand, outcome)
  return hand if outcome == :draw

  case hand
  when :rock
    outcome == :win ? :paper : :scisor
  when :paper
    outcome == :win ? :scisor : :rock
  when :scisor
    outcome == :win ? :rock : :paper
  end
end

score = 0
File.readlines("input").each do |line|
  oponent, player = line.split(" ")

  hand_score = player_hands.keys.index(player) + 1

  oponent = oponent_hands[oponent]
  player = player_hands[player]
  score += rock_paper_scisor(player, oponent) + hand_score
end

puts "solution a: #{score}"

score = 0
outcomes  = {"X" => :lose, "Y" => :draw, "Z" => :win}
File.readlines("input").each do |line|
  oponent, outcome = line.split(" ")

  oponent = oponent_hands[oponent]
  outcome = outcomes[outcome]

  hand = hand_for_outcome(oponent, outcome)
  hand_score = player_hands.values.index(hand) + 1

  case outcome
  when :win
    score += (6 + hand_score)
  when :draw
    score += (3 + hand_score)
  when :lose
    score += hand_score
  end
end

puts "solution b: #{score}"
