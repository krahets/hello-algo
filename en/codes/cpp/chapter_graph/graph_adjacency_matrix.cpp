/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Undirected graph represented by an adjacency matrix */
class GraphAdjMat {
    vector<int> vertices;       // Vertex list: each element holds a vertex value, and its position is the vertex index
    vector<vector<int>> adjMat; // Adjacency matrix: row and column indices are vertex indices

  public:
    /* Constructor */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // Add a vertex
        for (int val : vertices) {
            addVertex(val);
        }
        // Add an edge
        // The entries in edges are vertex indices, that is, indices into vertices
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* Get the vertex count */
    int size() const {
        return vertices.size();
    }

    /* Add a vertex */
    void addVertex(int val) {
        int n = size();
        // Append the new vertex value to the vertex list
        vertices.push_back(val);
        // Add a row to the adjacency matrix
        adjMat.emplace_back(vector<int>(n, 0));
        // Add a column to the adjacency matrix
        for (vector<int> &row : adjMat) {
            row.push_back(0);
        }
    }

    /* Remove a vertex */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("Vertex does not exist");
        }
        // Remove the vertex at the specified index from the vertex list
        vertices.erase(vertices.begin() + index);
        // Remove the row at the specified index from the adjacency matrix
        adjMat.erase(adjMat.begin() + index);
        // Remove the column at the specified index from the adjacency matrix
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* Add an edge */
    // Parameters i and j are indices into vertices
    void addEdge(int i, int j) {
        // Check for out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Vertex does not exist");
        }
        // An undirected graph has a symmetric adjacency matrix: (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Remove an edge */
    // Parameters i and j are indices into vertices
    void removeEdge(int i, int j) {
        // Check for out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Vertex does not exist");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* Print the adjacency matrix */
    void print() {
        cout << "Vertex list = ";
        printVector(vertices);
        cout << "Adjacency matrix =" << endl;
        printVectorMatrix(adjMat);
    }
};

/* Driver code */
int main() {
    /* Initialize an undirected graph */
    // The entries in edges are vertex indices, that is, indices into vertices
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\nGraph after initialization:" << endl;
    graph.print();

    /* Add an edge */
    // Vertices 1 and 2 have indices 0 and 2, respectively
    graph.addEdge(0, 2);
    cout << "\nGraph after adding edge 1-2:" << endl;
    graph.print();

    /* Remove an edge */
    // Vertices 1 and 3 have indices 0 and 1, respectively
    graph.removeEdge(0, 1);
    cout << "\nGraph after removing edge 1-3:" << endl;
    graph.print();

    /* Add a vertex */
    graph.addVertex(6);
    cout << "\nGraph after adding vertex 6:" << endl;
    graph.print();

    /* Remove a vertex */
    // Vertex 3 has index 1
    graph.removeVertex(1);
    cout << "\nGraph after removing vertex 3:" << endl;
    graph.print();

    return 0;
}
