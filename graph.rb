require 'set'

class Edge
    attr_reader :u, :v

    def initialize(u, v)
        @u, @v = u, v
    end
end

class WeightedEdge < Edge
    attr_accessor :weight

    def initialize(u, v, weight)
        super(u, v)
        @weight = weight
    end
end

class Vertex
    attr_reader :symbol, :edges

    def initialize(symbol)
        @symbol = symbol
        @edges = Set.new
    end

    def insert_edge(edge)
        @edges.add(edge)
    end

    def find_edge(vertex)
        @edges.detect {|edge| edge.v === vertex.symbol}
    end

    def delete_edge(edge)
        @edges.delete(edge)
    end
end

class Graph
    attr_reader :vertices

    def initialize(vertices=Set.new)
        @vertices = vertices
    end

    def insert_vertex(vertex)
        @vertices.add(vertex)
    end

    def delete_vertex(vertex)
        @vertices.delete(vertex)
    end

    def find_vertex(vertex)
        @vertices.detect {|element| element === vertex}
    end

    def bfs(start, finish)
        to_explore = Queue.new.push start
        seen = Set.new.add start
        while !to_explore.empty?
            current = to_explore.pop
            if current === finish
                return current
            end
            
            for edge in current.edges
                unless seen.include? edge.v
                    seen.add edge.v
                    to_explore.push edge.v 
                end
            end
        end
    end

    def dfs(start, finish)
        to_explore = Array.new.push start
        seen = Set.new.add start
        while !to_explore.empty?
            current = to_explore.pop
            if current === finish
                return current
            end
            
            for edge in current.edges
                unless seen.include? edge.v
                    seen.add edge.v
                    to_explore.push edge.v 
                end
            end
        end
    end
end

v1 = Vertex.new(:'New York')
v2 = Vertex.new(:'London')
v3 = Vertex.new(:'Paris')
v4 = Vertex.new(:'Tokyo')
v5 = Vertex.new(:'Buenos Aires')

v1.insert_edge(Edge.new(v1, v2))
v2.insert_edge(Edge.new(v2, v3))
v3.insert_edge(Edge.new(v3, v4))
v4.insert_edge(Edge.new(v4, v5))

graph = Graph.new()
graph.insert_vertex(v1)
graph.insert_vertex(v2)
graph.insert_vertex(v3)

puts graph.bfs(v1, v5)
puts graph.dfs(v1, v5)