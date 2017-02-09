$app_state = {
  towers: [[1,2,3], [], []],

  move: nil,
  win?: false
}

def instructions
  msgs = [
    "Welcome to Tower of Hanoi",
    "",
    "Instructions:",
    "Enter where you'd like to move from and to",
    "in the format '1,3'. Enter 'q' to quit.",
    ""
  ]
  msgs.each {|msg| puts msg}
end

def render towers
  "prints the state of the game board in between turns"
  puts "Current Board:"
  lines = Hash.new ""
  towers.each_with_index do |disks, rod|
    disks.each_with_index do |disk, i|
      txt = "o"*disk
      lines[i] += lines[i].empty? ? txt : ("\t"*rod)+txt
    end
  end
  lines.each do |line, txt|
    puts txt
  end
  puts "1\t2\t3\t"
end

def move_tower from, to
  tower_level = $app_state[:towers][from-1].shift
  $app_state[:towers][to-1].unshift tower_level
end

def win? towers
  if towers[2] == [1,2,3]
    $app_state[:win?] = true
  end
end

def play
  instructions
  render($app_state[:towers])
  while ($app_state[:win?] != true)
    puts $app_state
    puts "Enter move >"
    move = gets.chomp
    if move == "q"
      break
    end
    $app_state[:move] = move.split(",").map{|s| s.to_i}
    from, to = $app_state[:move]
    puts "#{$app_state}"
    move_tower(from, to)
    win?($app_state[:towers])
    puts "#{$app_state}"
    render($app_state[:towers])
  end
end

play









def move_disk fp, tp
  puts "moving disk from #{fp} to #{tp}"
end

def move_tower height, from_pole, to_pole, with_pole
  if height >= 1
    move_tower(height-1, from_pole, with_pole, to_pole)
    move_disk(from_pole, to_pole)
    move_tower(height-1, with_pole, to_pole, from_pole)
  end
end

# move_tower 3, "A", "B", "C"
