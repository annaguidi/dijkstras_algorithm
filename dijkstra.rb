require 'pry'
# v is equivalent to infinity
v = 100000
solved_nodes = ["yellowstone"]
feasible = {}


hash1 = {
  "yellowstone" => [0,0], "livingston" => [v, 0], "butte"=> [v, 0],
  "missoula"=> [v, 0], "idaho"=> [v, 0], "boise"=> [v, 0],
  "twinfalls"=> [v, 0], "saltlake"=> [v, 0], "wells"=> [v,0],
  "winnemuca"=> [v, 0], "ely"=> [v, 0], "reno" => [v, 0],
  "sacramento"=> [v, 0], "bishop"=> [v,0], "yosemite"=> [v,0]
}


network = [
  [ {s: "yellowstone", t: "livingston", c: 95},
    {s: "yellowstone", t: "idaho", c: 140}
  ],
  [
    {s: "livingston", t: "butte", c: 110}
  ],
  [ {s: "butte", t: "idaho", c: 220},
    {s: "butte", t: "missoula", c: 120}
  ],
  [
    {s: "missoula", t: "boise", c: 490}
  ],
  [ {s: "idaho", t: "saltlake", c: 215},
    {s: "idaho", t: "twinfalls", c: 165}
  ],
  [ {s: "boise", t: "twinfalls", c: 140},
    {s: "boise", t: "winnemuca", c: 310}
  ],
  [
    {s: "twinfalls", t: "wells", c: 150}
  ],
  [
    {s: "saltlake", t: "wells", c: 185},
    {s: "saltlake", t: "ely", c: 270}
  ],
  [
    {s: "wells", t: "winnemuca", c: 170},
    {s: "wells", t: "ely", c: 190}
  ],
  [
    {s: "winnemuca", t: "reno", c: 165}
  ],
  [
    {s: "ely", t: "bishop", c: 350}
  ],
  [
    {s: "reno", t: "bishop", c: 265},
    {s: "reno", t: "sacramento", c: 160},
    {s: "reno", t: "yosemite", c: 235}
  ],
  [
    {s: "sacramento", t: "yosemite", c: 290}
  ],
  [
    {s: "bishop", t: "yosemite", c: 140}
  ]
]

def dijkstra(nodes, network, hash1, feasible)
  return if nodes.include?("yosemite")
  network.each do |i|
    #binding.pry
    i.each do |j|
      #only evaluate neighbouring nodes
      if nodes.include?(j[:s])
        sum = hash1[j[:s]].first + j[:c]
        if sum < hash1[j[:t]].first
          # update hash1
          hash1[j[:t]] = [sum, j[:s]]
          #add to the hash of feasible nodes
          feasible[j[:t]] = sum
        else
          next
        end
      end
    end
  end

  #methodology to label the nearest but non-repetitive node as "solved"
  feasible.sort_by {|k,v| v}
  new_nodes = feasible.keys - nodes
  new_val = new_nodes[0]
  nodes.push(new_val)
  dijkstra(nodes, network, hash1, feasible)

  puts hash1
end

dijkstra(solved_nodes, network, hash1, feasible)

print "\nthis is the final row:  "
print hash1
