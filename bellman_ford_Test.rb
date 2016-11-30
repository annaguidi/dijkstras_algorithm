require 'pry'
# v is equivalent to infinity
v = 1000

hash1 = { 1 => [0,0], 2 => [v, 0], 3=> [v, 0], 4=> [v, 0], 5=> [v, 0], 6=> [v, 0]}

network = [
  [ {s: 1, t: 2, c: 3},
    {s: 1, t: 3, c: 7}
  ],
  [ {s: 2, t: 3, c: 4},
    {s: 2, t: 4, c: 2}
  ],
  [ {s: 3, t: 4, c: 1},
    {s: 3, t: 5, c: 2}
  ],
  [ {s: 4, t: 6, c: 8},
    {s: 4, t: 3, c: 1},
    {s: 4, t: 5, c: 4}
  ],
  [
    {s: 5, t: 6, c: 3}
  ]
]

network.each do |i|
  i.each do |j|
    if hash1[j[:s]].first + j[:c] < hash1[j[:t]].first
      sum = hash1[j[:s]].first + j[:c]
      hash1[j[:t]] = [sum, j[:s]]
    else
      next
    end
  end
end


network.each do |i|
  i.each do |j|
    if hash1[j[:s]].first + j[:c] < hash1[j[:t]].first
      sum = hash1[j[:s]].first + j[:c]
      hash1[j[:t]] = [sum, j[:s]]
    else
      next
    end
  end
end

puts hash1
