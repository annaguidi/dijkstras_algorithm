require 'pry'
v = 100000

hash1 = {
  "yellowstone" => [0,0], "livingston" => [v, 0], "butte"=> [v, 0],
  "missoula"=> [v, 0], "idaho"=> [v, 0], "boise"=> [v, 0],
  "twinfalls"=> [v, 0], "saltlake"=> [v, 0], "wells"=> [v,0],
  "winnemuca"=> [v, 0], "ely"=> [v, 0], "reno" => [v, 0],
  "sacramento"=> [v, 0], "bishop"=> [v,0], "yosemite"=> [v,0]
}


network = [
  [ {s: "yellowstone", t: "livingston", c: 60},
    {s: "yellowstone", t: "idaho", c: 100}
  ],
  [
    {s: "livingston", t: "butte", c: 105}
  ],
  [ {s: "butte", t: "idaho", c: 205},
    {s: "butte", t: "missoula", c: 120}
  ],
  [
    {s: "missoula", t: "boise", c: 370}
  ],
  [ {s: "idaho", t: "saltlake", c: 210},
    {s: "idaho", t: "twinfalls", c: 160}
  ],
  [ {s: "boise", t: "twinfalls", c: 130},
    {s: "boise", t: "winnemuca", c: 255}
  ],
  [
    {s: "twinfalls", t: "wells", c: 120}
  ],
  [
    {s: "saltlake", t: "wells", c: 180},
    {s: "saltlake", t: "ely", c: 240}
  ],
  [
    {s: "wells", t: "winnemuca", c: 175},
    {s: "wells", t: "ely", c: 140}
  ],
  [
    {s: "winnemuca", t: "reno", c: 165}
  ],
  [
    {s: "ely", t: "bishop", c: 285}
  ],
  [
    {s: "reno", t: "bishop", c: 205},
    {s: "reno", t: "sacramento", c: 135},
    {s: "reno", t: "yosemite", c: 155}
  ],
  [
    {s: "sacramento", t: "yosemite", c: 195}
  ],
  [
    {s: "bishop", t: "yosemite", c: 65}
  ]
]

network.each do |i|
  i.each do |j|
    # binding.pry
    sum = hash1[j[:s]].first + j[:c]
    if sum < hash1[j[:t]].first
      hash1[j[:t]] = [sum, j[:s]]
    else
      next
    end
  end
  puts hash1
end

20.times do
  network.each do |i|
    i.each do |j|
      sum = hash1[j[:s]].first + j[:c]
      if sum < hash1[j[:t]].first
        hash1[j[:t]] = [sum, j[:s]]
      else
        next
      end
    end
  end
  puts hash1
end

print "\nthis is the final row:  "
print hash1
