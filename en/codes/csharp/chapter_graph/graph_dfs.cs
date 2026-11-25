/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* Helper for depth-first traversal */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // Record the visited vertex
        visited.Add(vet); // Mark the vertex as visited
        // Iterate over all neighbors of this vertex
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // Skip visited vertices                             
            }
            // Visit neighbors recursively
            DFS(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal order
        List<Vertex> res = [];
        // Use a hash set to track visited vertices
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }

    [Test]
    public void Test() {
        /* Initialize an undirected graph */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\nGraph after initialization:");
        graph.Print();

        /* Depth-first traversal */
        List<Vertex> res = GraphDFS(graph, v[0]);
        Console.WriteLine("\nDepth-first search (DFS) visits the vertices in this order:");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
