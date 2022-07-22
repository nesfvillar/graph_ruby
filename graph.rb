require 'set'

class Graph
    attr_reader :nodes
    def initialize
        @nodes = Hash.new
    end

    def insert_node(node)
        @nodes[node] = Array.new
    end

    def insert_edge(u, v)
        @nodes[u].push v
    end

    def bfs(start, finish)
        unexplored = Queue.new
        unexplored.push start

        explored = Set.new
        while !unexplored.empty?
            current = unexplored.pop

            if current == finish
                return current
            end
            
            explored.add current
            for neighbour in @nodes[current]
                unless explored.include? neighbour
                    unexplored.push neighbour
                end
            end
        end
    end

    def dfs(start, finish)
        unexplored = Array.new
        unexplored.push start

        explored = Set.new
        while !unexplored.empty?
            current = unexplored.pop

            if current == finish
                return current
            end

            explored.add current
            for neighbour in @nodes[current]
                unless explored.include? neighbour
                    unexplored.push neighbour
                end
            end
        end
    end
end

graph = Graph.new

graph.insert_node(:'New York')
graph.insert_node(:London)
graph.insert_node(:Paris)

graph.insert_edge(:"New York", :London)
graph.insert_edge(:London, :Paris)

puts graph.nodes

graph.dfs(:'New York', :Paris)