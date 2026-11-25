/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import utils.*;
import java.util.*;

/* Undirected graph represented by an adjacency matrix */
class GraphAdjMat {
    List<Integer> vertices; // Vertex list: each element holds a vertex value, and its position is the vertex index
    List<List<Integer>> adjMat; // Adjacency matrix: row and column indices are vertex indices

    /* Constructor */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // Add a vertex
        for (int val : vertices) {
            addVertex(val);
        }
        // Add an edge
        // The entries in edges are vertex indices, that is, indices into vertices
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* Get the vertex count */
    public int size() {
        return vertices.size();
    }

    /* Add a vertex */
    public void addVertex(int val) {
        int n = size();
        // Append the new vertex value to the vertex list
        vertices.add(val);
        // Add a row to the adjacency matrix
        List<Integer> newRow = new ArrayList<>(n);
        for (int j = 0; j < n; j++) {
            newRow.add(0);
        }
        adjMat.add(newRow);
        // Add a column to the adjacency matrix
        for (List<Integer> row : adjMat) {
            row.add(0);
        }
    }

    /* Remove a vertex */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // Remove the vertex at the specified index from the vertex list
        vertices.remove(index);
        // Remove the row at the specified index from the adjacency matrix
        adjMat.remove(index);
        // Remove the column at the specified index from the adjacency matrix
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* Add an edge */
    // Parameters i and j are indices into vertices
    public void addEdge(int i, int j) {
        // Check for out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // An undirected graph has a symmetric adjacency matrix: (i, j) == (j, i)
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* Remove an edge */
    // Parameters i and j are indices into vertices
    public void removeEdge(int i, int j) {
        // Check for out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        adjMat.get(i).set(j, 0);
        adjMat.get(j).set(i, 0);
    }

    /* Print the adjacency matrix */
    public void print() {
        System.out.print("Vertex list = ");
        System.out.println(vertices);
        System.out.println("Adjacency matrix =");
        PrintUtil.printMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    public static void main(String[] args) {
        /* Initialize an undirected graph */
        // The entries in edges are vertex indices, that is, indices into vertices
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\nGraph after initialization:");
        graph.print();

        /* Add an edge */
        // Vertices 1 and 2 have indices 0 and 2, respectively
        graph.addEdge(0, 2);
        System.out.println("\nGraph after adding edge 1-2:");
        graph.print();

        /* Remove an edge */
        // Vertices 1 and 3 have indices 0 and 1, respectively
        graph.removeEdge(0, 1);
        System.out.println("\nGraph after removing edge 1-3:");
        graph.print();

        /* Add a vertex */
        graph.addVertex(6);
        System.out.println("\nGraph after adding vertex 6:");
        graph.print();

        /* Remove a vertex */
        // Vertex 3 has index 1
        graph.removeVertex(1);
        System.out.println("\nGraph after removing vertex 3:");
        graph.print();
    }
}
