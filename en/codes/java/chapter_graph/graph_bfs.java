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
    // Represent the graph with an adjacency list to access all neighbors of a given vertex
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // Vertex traversal sequence
        List<Vertex> res = new ArrayList<>();
        // Hash set recording visited vertices
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // Use a queue to implement BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // Starting from startVet, loop until all reachable vertices have been visited
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // Dequeue the front vertex
            res.add(vet);            // Record the visited vertex
            // Traverse all neighbors of this vertex
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // Skip vertices that have already been visited
                que.offer(adjVet);   // Enqueue only unvisited vertices
                visited.add(adjVet); // Mark this vertex as visited
            }
        }
        // Return the vertex traversal sequence
        return res;
    }

    public static void main(String[] args) {
        /* Initialize the undirected graph */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] },
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nGraph after initialization:");
        graph.print();

        /* Breadth-first traversal */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\nVertex sequence from breadth-first traversal (BFS):");
        System.out.println(Vertex.vetsToVals(res));
    }
}
