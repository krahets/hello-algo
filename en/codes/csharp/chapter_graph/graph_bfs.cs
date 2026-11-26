/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* Breadth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal order
        List<Vertex> res = [];
        // Use a hash set to track visited vertices
        HashSet<Vertex> visited = [startVet];
        // Use a queue for BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // Starting at vertex vet, loop until all reachable vertices have been visited
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // Dequeue the front vertex
            res.Add(vet);               // Record the visited vertex
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // Skip visited vertices
                }
                que.Enqueue(adjVet);   // Enqueue only unvisited vertices
                visited.Add(adjVet);   // Mark the vertex as visited
            }
        }

        // Return the vertex traversal order
        return res;
    }

    [Test]
    public void Test() {
        /* Initialize an undirected graph */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[1], v[4]], [v[2], v[5]], [v[3], v[4]],
            [v[3], v[6]], [v[4], v[5]], [v[4], v[7]],
            [v[5], v[8]], [v[6], v[7]], [v[7], v[8]]
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\nGraph after initialization:");
        graph.Print();

        /* Breadth-first traversal */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\nBreadth-first search (BFS) visits the vertices in this order:");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
