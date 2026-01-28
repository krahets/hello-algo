/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import utils.*;
import java.util.*;

/* Undirected graph class based on adjacency matrix */
class GraphAdjMat {
    List<Integer> vertices; // Vertex list, where the element represents the "vertex value" and the index represents the "vertex index"
    List<List<Integer>> adjMat; // Adjacency matrix, where the row and column indices correspond to the "vertex index"

    /* Constructor */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // Add vertex
        for (int val : vertices) {
            addVertex(val);
        }
        // Add edge
        // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* Get the number of vertices */
    public int size() {
        return vertices.size();
    }

    /* Add vertex */
    public void addVertex(int val) {
        int n = size();
        // Add the value of the new vertex to the vertex list
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

    /* Remove vertex */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // Remove the vertex at index from the vertex list
        vertices.remove(index);
        // Remove the row at index from the adjacency matrix
        adjMat.remove(index);
        // Remove the column at index from the adjacency matrix
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* Add edge */
    // Parameters i, j correspond to the vertices element indices
    public void addEdge(int i, int j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., (i, j) == (j, i)
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* Remove edge */
    // Parameters i, j correspond to the vertices element indices
    public void removeEdge(int i, int j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        adjMat.get(i).set(j, 0);
        adjMat.get(j).set(i, 0);
    }

    /* Print adjacency matrix */
    public void print() {
        System.out.print("Vertex list = ");
        System.out.println(vertices);
        System.out.println("Adjacency matrix =");
        PrintUtil.printMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    public static void main(String[] args) {
        /* Add edge */
        // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\nAfter initialization, graph is");
        graph.print();

        /* Add edge */
        // Add vertex
        graph.addEdge(0, 2);
        System.out.println("\nAfter adding edge 1-2, graph is");
        graph.print();

        /* Remove edge */
        // Vertices 1, 3 have indices 0, 1 respectively
        graph.removeEdge(0, 1);
        System.out.println("\nAfter removing edge 1-3, graph is");
        graph.print();

        /* Add vertex */
        graph.addVertex(6);
        System.out.println("\nAfter adding vertex 6, graph is");
        graph.print();

        /* Remove vertex */
        // Vertex 3 has index 1
        graph.removeVertex(1);
        System.out.println("\nAfter removing vertex 3, graph is");
        graph.print();
    }
}
