def find_lowest_cost(costs, processed = [])
  min_node_not_processed = costs
    .reject { |k, v| processed.include?(k) }
    .min_by { |k, v| v }

  return min_node_not_processed && min_node_not_processed.first
end

def search(graph, start_node, finish_node)
  costs = graph[start_node]
  parents = {}
  processed = []
  node = find_lowest_cost(costs, processed)

  while !node.nil? do
    cost_to_node = costs[node]
    neighbors = graph[node]
    neighbors.each do |k, v|
      new_cost_to_node = cost_to_node + v
      if new_cost_to_node < costs[k]
        costs[k] = new_cost_to_node
        parents[k] = node
      end
    end

    processed << node
    node = find_lowest_cost(costs, processed)
  end

  [parents, costs]
end

def build_path(parents, start_node, finish_node)
  current_node = finish_node
  path = []

  while !parents[current_node].nil? do
    parent = parents[current_node]
    path.concat [current_node, parent]
    current_node = parent
  end

  path << start_node
  path.flatten.uniq.reverse
end

inf = Float::INFINITY

data_1 = {
  s: { a: 6, b: 2, f: inf },
  a: { f: 1 },
  b: { a: 3, f: 5 },
  f: {},
}

data_2 = {
  s: { a: 5, b: 2, c: inf, d: inf, f: inf },
  a: { c: 4, d: 2, f: inf },
  b: { a: 8, d: 7, c: inf, f: inf },
  c: { f: 3, d: inf },
  d: { f: 1 },
  f: {},
}

data_3 = {
  s: { a: 10, b: inf, c: inf, f: inf },
  a: { b: 20, f: inf },
  b: { c: 1, f: 30 },
  c: { a: 1, b: inf, f: inf },
  f: {},
}

parents_1, _costs_1 = search(data_1, :s, :f)
puts build_path(parents_1, :s, :f) == [:s,:b,:a,:f]

parents_2, _costs_2 = search(data_2, :s, :f)
puts build_path(parents_2, :s, :f) == [:s,:a,:d,:f]

parents_3, _costs_3 = search(data_3, :s, :f)
puts build_path(parents_3, :s, :f) == [:s,:a,:b,:f]

