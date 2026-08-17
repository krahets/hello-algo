/**
 * File: graph_adjacency_list.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

/* Undirected graph class based on adjacency list */
class GraphAdjList {
    // Adjacency list, key: vertex, value: all adjacent vertices of that vertex
    Map<Vertex, List<Vertex>> adjList;

    /* Constructor */
    public GraphAdjList(Vertex[][] edges) {
        this.adjList = new HashMap<>();
        // Add all vertices and edges
        for (Vertex[] edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* Get the number of vertices */
    public int size() {
        return adjList.size();
    }

    /* Add edge */
    public void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // Add edge vet1 - vet2
        adjList.get(vet1).add(vet2);
        adjList.get(vet2).add(vet1);
    }

    /* Remove edge */
    public void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // Remove edge vet1 - vet2
        adjList.get(vet1).remove(vet2);
        adjList.get(vet2).remove(vet1);
    }

    /* Add vertex */
    public void addVertex(Vertex vet) {
        if (adjList.containsKey(vet))
            return;
        // Add a new linked list in the adjacency list
        adjList.put(vet, new ArrayList<>());
    }

    /* Remove vertex */
    public void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet))
            throw new IllegalArgumentException();
        // Remove the linked list corresponding to vertex vet in the adjacency list
        adjList.remove(vet);
        // Traverse the linked lists of other vertices and remove all edges containing vet
        for (List<Vertex> list : adjList.values()) {
            list.remove(vet);
        }
    }

    /* Print adjacency list */
    public void print() {
        System.out.println("Adjacency list =");
        for (Map.Entry<Vertex, List<Vertex>> pair : adjList.entrySet()) {
            List<Integer> tmp = new ArrayList<>();
            for (Vertex vertex : pair.getValue())
                tmp.add(vertex.val);
            System.out.println(pair.getKey().val + ": " + tmp + ",");
        }
    }
}

public class graph_adjacency_list {
    public static void main(String[] args) {
        /* Add edge */
        Vertex[] v = Vertex.valsToVets(new int[] { 1, 3, 2, 5, 4 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[3] }, { v[2], v[4] }, { v[3], v[4] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nAfter initialization, graph is");
        graph.print();

        /* Add edge */
        // Vertices 1, 3 are v[0], v[1]
        graph.addEdge(v[0], v[2]);
        System.out.println("\nAfter adding edge 1-2, graph is");
        graph.print();

        /* Remove edge */
        // Vertex 3 is v[1]
        graph.removeEdge(v[0], v[1]);
        System.out.println("\nAfter removing edge 1-3, graph is");
        graph.print();

        /* Add vertex */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        System.out.println("\nAfter adding vertex 6, graph is");
        graph.print();

        /* Remove vertex */
        // Vertex 3 is v[1]
        graph.removeVertex(v[1]);
        System.out.println("\nAfter removing vertex 3, graph is");
        graph.print();
    }
}
