require 'set'

class Edge
    def initialize(u, v)
        @u, @v = u, v
    end

    def u(); @u; end

    def v(); @v; end
end

class WeightedEdge < Edge
    def initialize(u, v, weight)
        super(u, v)
        @weight = weight
    end
end

class Vertex
    def initialize(symbol)
        @symbol = symbol
        @edges = Set.new
    end

    def symbol(); @symbol; end

    def edges(); @edges; end

    def insert_edge(vertex)
        @edges.add(Edge.new(@symbol, vertex.symbol))
    end

    def insert_weighted_edge(vertex, weight)
        @edges.add(WeightedEdge.new(@symbol, vertex.symbol, weight))
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
    def initialize(vertices=Set.new)
        @vertices = vertices
    end

    def vertices(); @vertices; end

    def insert_vertex(vertex)
        @vertices.add(vertex)
    end

    def delete_vertex(vertex)
        @vertices.delete(vertex)
    end

    def find_vertex(vertex)
        for v in @vertices
            if v.symbol == vertex
                return v
            end
        end
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