/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* Depth-first traversal helper function */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // Record visited vertex
        visited.Add(vet); // Mark the vertex as visited
        // Traverse all adjacent vertices of that vertex
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // Skip visited vertices
            }
            // Recursively visit adjacent vertices
            DFS(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = [];
        // Hash set, used to record visited vertices
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }

    [Test]
    public void Test() {
        /* Initialize undirected graph */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\nAfter initialization, the graph is");
        graph.Print();

        /* Depth-first traversal */
        List<Vertex> res = GraphDFS(graph, v[0]);
        Console.WriteLine("\nDepth-first traversal (DFS) vertex sequence is");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
