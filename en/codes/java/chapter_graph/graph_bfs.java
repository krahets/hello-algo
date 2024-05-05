/**
 * File: graph_bfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_bfs {
    /* Breadth-first traversal */
    // Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = new ArrayList<>();
        // Hash set, used to record visited vertices
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // Queue used to implement BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // Starting from vertex vet, loop until all vertices are visited
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // Dequeue the vertex at the head of the queue
            res.add(vet);            // Record visited vertex
            // Traverse all adjacent vertices of that vertex
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // Skip already visited vertices
                que.offer(adjVet);   // Only enqueue unvisited vertices
                visited.add(adjVet); // Mark the vertex as visited
            }
        }
        // Return the vertex traversal sequence
        return res;
    }

    public static void main(String[] args) {
        /* Initialize undirected graph */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] },
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nAfter initialization, the graph is");
        graph.print();

        /* Breadth-first traversal */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\nBreadth-first traversal (BFS) vertex sequence is");
        System.out.println(Vertex.vetsToVals(res));
    }
}
