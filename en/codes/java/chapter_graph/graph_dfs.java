/**
 * File: graph_dfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_dfs {
    /* Depth-first traversal helper function */
    static void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // Record visited vertex
        visited.add(vet); // Mark this vertex as visited
        // Traverse all adjacent vertices of this vertex
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // Skip vertices that have been visited
            // Recursively visit adjacent vertices
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Depth-first traversal */
    // Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
    static List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = new ArrayList<>();
        // Hash set for recording vertices that have been visited
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }

    public static void main(String[] args) {
        /* Add edge */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[5] }, { v[4], v[5] }, { v[5], v[6] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nAfter initialization, graph is");
        graph.print();

        /* Depth-first traversal */
        List<Vertex> res = graphDFS(graph, v[0]);
        System.out.println("\nDepth-first traversal (DFS) vertex sequence is");
        System.out.println(Vertex.vetsToVals(res));
    }
}
