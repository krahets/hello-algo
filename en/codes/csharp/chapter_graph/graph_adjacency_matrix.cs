/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* Undirected graph class based on adjacency matrix */
class GraphAdjMat {
    List<int> vertices;     // Vertex list, elements represent "vertex value", index represents "vertex index"
    List<List<int>> adjMat; // Adjacency matrix, row and column indices correspond to "vertex index"

    /* Constructor */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = [];
        this.adjMat = [];
        // Add vertex
        foreach (int val in vertices) {
            AddVertex(val);
        }
        // Add edge
        // Please note, edges elements represent vertex indices, corresponding to vertices elements indices
        foreach (int[] e in edges) {
            AddEdge(e[0], e[1]);
        }
    }

    /* Get the number of vertices */
    int Size() {
        return vertices.Count;
    }

    /* Add vertex */
    public void AddVertex(int val) {
        int n = Size();
        // Add new vertex value to the vertex list
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

    /* Remove vertex */
    public void RemoveVertex(int index) {
        if (index >= Size())
            throw new IndexOutOfRangeException();
        // Remove vertex at `index` from the vertex list
        vertices.RemoveAt(index);
        // Remove the row at `index` from the adjacency matrix
        adjMat.RemoveAt(index);
        // Remove the column at `index` from the adjacency matrix
        foreach (List<int> row in adjMat) {
            row.RemoveAt(index);
        }
    }

    /* Add edge */
    // Parameters i, j correspond to vertices element indices
    public void AddEdge(int i, int j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., satisfies (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Remove edge */
    // Parameters i, j correspond to vertices element indices
    public void RemoveEdge(int i, int j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* Print adjacency matrix */
    public void Print() {
        Console.Write("Vertex list =");
        PrintUtil.PrintList(vertices);
        Console.WriteLine("Adjacency matrix =");
        PrintUtil.PrintMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* Initialize undirected graph */
        // Please note, edges elements represent vertex indices, corresponding to vertices elements indices
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
        Console.WriteLine("\nAfter initialization, the graph is");
        graph.Print();

        /* Add edge */
        // Indices of vertices 1, 2 are 0, 2 respectively
        graph.AddEdge(0, 2);
        Console.WriteLine("\nAfter adding edge 1-2, the graph is");
        graph.Print();

        /* Remove edge */
        // Indices of vertices 1, 3 are 0, 1 respectively
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\nAfter removing edge 1-3, the graph is");
        graph.Print();

        /* Add vertex */
        graph.AddVertex(6);
        Console.WriteLine("\nAfter adding vertex 6, the graph is");
        graph.Print();

        /* Remove vertex */
        // Index of vertex 3 is 1
        graph.RemoveVertex(1);
        Console.WriteLine("\nAfter removing vertex 3, the graph is");
        graph.Print();
    }
}
