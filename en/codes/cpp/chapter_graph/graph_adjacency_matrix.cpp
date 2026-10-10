/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Undirected graph class based on adjacency matrix */
class GraphAdjMat {
    vector<int> vertices;       // Vertex list, where the element represents the "vertex value" and the index represents the "vertex index"
    vector<vector<int>> adjMat; // Adjacency matrix, where the row and column indices correspond to the "vertex index"

  public:
    /* Constructor */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // Add vertex
        for (int val : vertices) {
            addVertex(val);
        }
        // Add edge
        // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* Get the number of vertices */
    int size() const {
        return vertices.size();
    }

    /* Add vertex */
    void addVertex(int val) {
        int n = size();
        // Add the value of the new vertex to the vertex list
        vertices.push_back(val);
        // Add a row to the adjacency matrix
        adjMat.emplace_back(vector<int>(n, 0));
        // Add a column to the adjacency matrix
        for (vector<int> &row : adjMat) {
            row.push_back(0);
        }
    }

    /* Remove vertex */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("Vertex does not exist");
        }
        // Remove the vertex at index from the vertex list
        vertices.erase(vertices.begin() + index);
        // Remove the row at index from the adjacency matrix
        adjMat.erase(adjMat.begin() + index);
        // Remove the column at index from the adjacency matrix
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* Add edge */
    // Parameters i, j correspond to the vertices element indices
    void addEdge(int i, int j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Vertex does not exist");
        }
        // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Remove edge */
    // Parameters i, j correspond to the vertices element indices
    void removeEdge(int i, int j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Vertex does not exist");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* Print adjacency matrix */
    void print() {
        cout << "Vertex list = ";
        printVector(vertices);
        cout << "Adjacency matrix =" << endl;
        printVectorMatrix(adjMat);
    }
};

/* Driver Code */
int main() {
    /* Add edge */
    // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\nAfter initialization, graph is" << endl;
    graph.print();

    /* Add edge */
    // Add vertex
    graph.addEdge(0, 2);
    cout << "\nAfter adding edge 1-2, graph is" << endl;
    graph.print();

    /* Remove edge */
    // Vertices 1, 3 have indices 0, 1 respectively
    graph.removeEdge(0, 1);
    cout << "\nAfter removing edge 1-3, graph is" << endl;
    graph.print();

    /* Add vertex */
    graph.addVertex(6);
    cout << "\nAfter adding vertex 6, graph is" << endl;
    graph.print();

    /* Remove vertex */
    // Vertex 3 has index 1
    graph.removeVertex(1);
    cout << "\nAfter removing vertex 3, graph is" << endl;
    graph.print();

    return 0;
}
