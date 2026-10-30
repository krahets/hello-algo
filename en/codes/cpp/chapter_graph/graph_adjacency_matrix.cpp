/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Undirected graph class implemented with an adjacency matrix */
class GraphAdjMat {
    vector<int> vertices;       // Vertex list: elements are vertex values, and indices are vertex indices
    vector<vector<int>> adjMat; // Adjacency matrix: row and column indices correspond to vertex indices

  public:
    /* Constructor */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // Add a vertex
        for (int val : vertices) {
            addVertex(val);
        }
        // Add an edge
        // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* Get the number of vertices */
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
            throw out_of_range("Invalid vertex");
        }
        // Remove the vertex at index `index` from the vertex list
        vertices.erase(vertices.begin() + index);
        // Remove row `index` from the adjacency matrix
        adjMat.erase(adjMat.begin() + index);
        // Remove column `index` from the adjacency matrix
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* Add an edge */
    // Parameters i and j are element indices in vertices
    void addEdge(int i, int j) {
        // Handle out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Invalid vertex");
        }
        // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Remove an edge */
    // Parameters i and j are element indices in vertices
    void removeEdge(int i, int j) {
        // Handle out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Invalid vertex");
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
    /* Initialize the undirected graph */
    // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
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
