import Foundation

struct Edge {
    let destination: Int
    let weight: Int
}

class dijkstra {
    let numVertices: Int
    var graph: [[Edge]]

    init(numVertices: Int, graph: [[Edge]]) {
        self.numVertices = numVertices
        self.graph = graph
    }

    func dijkstra(source: Int) -> [Int] {
        var dist: [Int] = Array(repeating: Int.max, count: numVertices)
        var visited: [Bool] = Array(repeating: false, count: numVertices)

        dist[source] = 0

        for _ in 0..<numVertices-1 {
            let minDistVertex = minDistance(dist: dist, visited: visited)
            
            visited[minDistVertex] = true
            
            for edge in graph[minDistVertex] {
                let v = edge.destination
                let weight = edge.weight
                
                if !visited[v] && dist[minDistVertex] != Int.max && dist[minDistVertex] + weight < dist[v] {
                    dist[v] = dist[minDistVertex] + weight
                }
            }
        }
        
        return dist
    }
    
    private func minDistance(dist: [Int], visited: [Bool]) -> Int {
        var minDist = Int.max
        var minDistVertex = -1
        
        for v in 0..<numVertices {
            if !visited[v] && dist[v] <= minDist {
                minDist = dist[v]
                minDistVertex = v
            }
        }
        
        return minDistVertex
    }
}

let graph: [[Edge]] = [
    [Edge(destination: 1, weight: 2), Edge(destination: 3, weight: 6)],
    [Edge(destination: 0, weight: 2), Edge(destination: 2, weight: 3), Edge(destination: 3, weight: 8), Edge(destination: 4, weight: 5)],
    [Edge(destination: 1, weight: 3), Edge(destination: 4, weight: 7)],
    [Edge(destination: 0, weight: 6), Edge(destination: 1, weight: 8), Edge(destination: 4, weight: 9), Edge(destination: 5, weight: 10)],
    [Edge(destination: 1, weight: 5), Edge(destination: 2, weight: 7), Edge(destination: 3, weight: 9), Edge(destination: 5, weight: 1)],
    [Edge(destination: 3, weight: 10), Edge(destination: 4, weight: 1)]
]

let dijkstra = dijkstra(numVertices: graph.count, graph: graph)
let dist = dijkstra.dijkstra(source: 0)

print("顶点   距离")
for i in 0..<dist.count {
    print("\(i)     \(dist[i])")
}
