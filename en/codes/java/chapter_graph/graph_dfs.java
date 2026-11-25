/**
 * File: graph_dfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_dfs {
    /* Helper for depth-first traversal */
    static void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // Record the visited vertex
        visited.add(vet); // Mark the vertex as visited
        // Iterate over all neighbors of this vertex
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // Skip visited vertices
            // Visit neighbors recursively
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Represent the graph with an adjacency list to look up all neighbors of a given vertex
    static List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal order
        List<Vertex> res = new ArrayList<>();
        // Use a hash set to track visited vertices
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }

    public static void main(String[] args) {
        /* Initialize an undirected graph */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[5] }, { v[4], v[5] }, { v[5], v[6] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nGraph after initialization:");
        graph.print();

        /* Depth-first traversal */
        List<Vertex> res = graphDFS(graph, v[0]);
        System.out.println("\nDepth-first search (DFS) visits the vertices in this order:");
        System.out.println(Vertex.vetsToVals(res));
    }
}
