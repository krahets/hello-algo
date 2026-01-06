/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = [];
        // Hash set for recording vertices that have been visited
        HashSet<Vertex> visited = [startVet];
        // Queue used to implement BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // Starting from vertex vet, loop until all vertices are visited
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // Dequeue the front vertex
            res.Add(vet);               // Record visited vertex
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // Skip vertices that have been visited
                }
                que.Enqueue(adjVet);   // Only enqueue unvisited vertices
                visited.Add(adjVet);   // Mark this vertex as visited
            }
        }

        // Return vertex traversal sequence
        return res;
    }

    [Test]
    public void Test() {
        /* Add edge */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[1], v[4]], [v[2], v[5]], [v[3], v[4]],
            [v[3], v[6]], [v[4], v[5]], [v[4], v[7]],
            [v[5], v[8]], [v[6], v[7]], [v[7], v[8]]
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\nAfter initialization, graph is");
        graph.Print();

        /* Breadth-first traversal */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\nBreadth-first traversal (BFS) vertex sequence is");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
