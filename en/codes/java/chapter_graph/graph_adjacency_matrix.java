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
    List<Integer> vertices; // Vertex list, elements represent "vertex value", index represents "vertex index"
    List<List<Integer>> adjMat; // Adjacency matrix, row and column indices correspond to "vertex index"

    /* Constructor */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // Add vertex
        for (int val : vertices) {
            addVertex(val);
        }
        // Add edge
        // Edges elements represent vertex indices
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
        // Add new vertex value to the vertex list
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
        // Remove vertex at `index` from the vertex list
        vertices.remove(index);
        // Remove the row at `index` from the adjacency matrix
        adjMat.remove(index);
        // Remove the column at `index` from the adjacency matrix
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* Add edge */
    // Parameters i, j correspond to vertices element indices
    public void addEdge(int i, int j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., satisfies (i, j) == (j, i)
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* Remove edge */
    // Parameters i, j correspond to vertices element indices
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
        /* Initialize undirected graph */
        // Edges elements represent vertex indices
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\nAfter initialization, the graph is");
        graph.print();

        /* Add edge */
        // Indices of vertices 1, 2 are 0, 2 respectively
        graph.addEdge(0, 2);
        System.out.println("\nAfter adding edge 1-2, the graph is");
        graph.print();

        /* Remove edge */
        // Indices of vertices 1, 3 are 0, 1 respectively
        graph.removeEdge(0, 1);
        System.out.println("\nAfter removing edge 1-3, the graph is");
        graph.print();

        /* Add vertex */
        graph.addVertex(6);
        System.out.println("\nAfter adding vertex 6, the graph is");
        graph.print();

        /* Remove vertex */
        // Index of vertex 3 is 1
        graph.removeVertex(1);
        System.out.println("\nAfter removing vertex 3, the graph is");
        graph.print();
    }
}
