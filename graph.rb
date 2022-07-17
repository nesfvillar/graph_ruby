require 'set'

class Edge
    def initialize(u, v)
        @u, @v = u, v
    end

    def v()
        @v
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

    def insert_edge(vertex)
        @edges.add(Edge.new(@symbol, vertex.symbol))
    end

    def find_edge(vertex)
        for edge in @edges
            if edge.v == vertex.symbol
                return edge
            end
        end
    end

    def delete_edge(vertex)
        @edges.delete(self.find_edge(vertex))
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

graph = Graph.new()
graph.insert_vertex(v1)
graph.insert_vertex(v2)

puts graph.vertices