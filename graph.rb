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

    def insert_edge(vertex)
        @edges.add(Edge.new(@symbol, vertex.symbol)) unless @edges.include?(find_edge(vertex))
    end

    def insert_weighted_edge(vertex, weight)
        @edges.add(WeightedEdge.new(@symbol, vertex.symbol, weight)) unless @edges.include?(find_edge(vertex))
    end

    def find_edge(vertex)
        @edges.detect {|edge| edge.v === vertex.symbol}
    end

    def delete_edge(vertex)
        @edges.delete(self.find_edge(vertex))
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
end

v1 = Vertex.new(:'New York')
v2 = Vertex.new(:'London')
v3 = Vertex.new(:'Paris')

v1.insert_edge(v2)
v2.insert_edge(v1)

v1.insert_weighted_edge(v3, 100)
v3.insert_weighted_edge(v1, 100)

v2.insert_weighted_edge(v3, 5)
v3.insert_weighted_edge(v2, 5)

graph = Graph.new()
graph.insert_vertex(v1)
graph.insert_vertex(v2)
graph.insert_vertex(v3)

puts graph.vertices