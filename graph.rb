require 'set'

class Edge
    def initialize(u, v)
        @u, @v = u, v
    end
end

class Vertex
    def initialize(symbol)
        @symbol = symbol
        @edges = Set.new
    end

    def symbol()
        @symbol
    end

    def edges()
        @edges
    end

    def insert_edge(v)
        @edges.add(Edge.new(@symbol, v.symbol))
    end
end

class Graph
    def initialize(vertices=Hash.new)
        @vertices = vertices
    end

    def vertices()
        @vertices
    end

    def insert_vertex(vertex)
        @vertices[vertex.symbol] = vertex
    end
end

v1 = Vertex.new(:'New York')
v2 = Vertex.new(:'London')

v1.insert_edge(v2)
v2.insert_edge(v1)

vertices = {:'New York' => v1, :'London' => v2}

graph = Graph.new(vertices)
graph.insert_vertex(v1)
graph.insert_vertex(v2)

puts graph.vertices