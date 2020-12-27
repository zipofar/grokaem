def search(name, graph)
  queue = [].concat(graph)
  searched = []

  while queue.any? do
    person = queue.shift

    next if searched.include?(person[:name])

    return true if name == person[:name]
    searched << person[:name]
    queue.concat(person[:friends])
  end

  false
end

data = [
  {
    name: 'you',
    friends: [
      { name: 'alice',
        friends: [
          { name: 'peggy', friends: [] },
        ]
      },
      { name: 'bob',
        friends: [
          { name: 'peggy', friends: [] },
          { name: 'anuj', friends: [] },
        ],
      },
      { name: 'claire',
        friends: [
          { name: 'thom', friends: [] },
          { name: 'john', friends: [] },
        ],
      },
    ],
  },
]

puts search('you', data) == true
puts search('john', data) == true
puts search('bob', data) == true
puts search('anna', data) == false

