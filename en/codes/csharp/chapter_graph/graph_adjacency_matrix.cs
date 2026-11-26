/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* Undirected graph represented by an adjacency matrix */
class GraphAdjMat {
    List<int> vertices;     // Vertex list: each element holds a vertex value, and its position is the vertex index
    List<List<int>> adjMat; // Adjacency matrix: row and column indices are vertex indices

    /* Constructor */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = [];
        this.adjMat = [];
        // Add a vertex
        foreach (int val in vertices) {
            AddVertex(val);
        }
        // Add an edge
        // The entries in edges are vertex indices, that is, indices into vertices
        foreach (int[] e in edges) {
            AddEdge(e[0], e[1]);
        }
    }

    /* Get the vertex count */
    int Size() {
        return vertices.Count;
    }

    /* Add a vertex */
    public void AddVertex(int val) {
        int n = Size();
        // Append the new vertex value to the vertex list
        vertices.Add(val);
        // Add a row to the adjacency matrix
        List<int> newRow = new(n);
        for (int j = 0; j < n; j++) {
            newRow.Add(0);
        }
        adjMat.Add(newRow);
        // Add a column to the adjacency matrix
        foreach (List<int> row in adjMat) {
            row.Add(0);
        }
    }

    /* Remove a vertex */
    public void RemoveVertex(int index) {
        if (index >= Size())
            throw new IndexOutOfRangeException();
        // Remove the vertex at the specified index from the vertex list
        vertices.RemoveAt(index);
        // Remove the row at the specified index from the adjacency matrix
        adjMat.RemoveAt(index);
        // Remove the column at the specified index from the adjacency matrix
        foreach (List<int> row in adjMat) {
            row.RemoveAt(index);
        }
    }

    /* Add an edge */
    // Parameters i and j are indices into vertices
    public void AddEdge(int i, int j) {
        // Check for out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        // An undirected graph has a symmetric adjacency matrix: (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Remove an edge */
    // Parameters i and j are indices into vertices
    public void RemoveEdge(int i, int j) {
        // Check for out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* Print the adjacency matrix */
    public void Print() {
        Console.Write("Vertex list = ");
        PrintUtil.PrintList(vertices);
        Console.WriteLine("Adjacency matrix =");
        PrintUtil.PrintMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* Initialize an undirected graph */
        // The entries in edges are vertex indices, that is, indices into vertices
        int[] vertices = [1, 3, 2, 5, 4];
        int[][] edges = 
        [
            [0, 1],
            [0, 3],
            [1, 2],
            [2, 3],
            [2, 4],
            [3, 4]
        ];
        GraphAdjMat graph = new(vertices, edges);
        Console.WriteLine("\nGraph after initialization:");
        graph.Print();

        /* Add an edge */
        // Vertices 1 and 2 have indices 0 and 2, respectively
        graph.AddEdge(0, 2);
        Console.WriteLine("\nGraph after adding edge 1-2:");
        graph.Print();

        /* Remove an edge */
        // Vertices 1 and 3 have indices 0 and 1, respectively
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\nGraph after removing edge 1-3:");
        graph.Print();

        /* Add a vertex */
        graph.AddVertex(6);
        Console.WriteLine("\nGraph after adding vertex 6:");
        graph.Print();

        /* Remove a vertex */
        // Vertex 3 has index 1
        graph.RemoveVertex(1);
        Console.WriteLine("\nGraph after removing vertex 3:");
        graph.Print();
    }
}
