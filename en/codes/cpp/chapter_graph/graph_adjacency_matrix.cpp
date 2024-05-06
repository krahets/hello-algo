/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Undirected graph class based on adjacency matrix */
class GraphAdjMat {
    vector<int> vertices;       // Vertex list, elements represent "vertex value", index represents "vertex index"
    vector<vector<int>> adjMat; // Adjacency matrix, row and column indices correspond to "vertex index"

  public:
    /* Constructor */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // Add vertex
        for (int val : vertices) {
            addVertex(val);
        }
        // Add edge
        // Edges elements represent vertex indices
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
        // Add new vertex value to the vertex list
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
        // Remove vertex at `index` from the vertex list
        vertices.erase(vertices.begin() + index);
        // Remove the row at `index` from the adjacency matrix
        adjMat.erase(adjMat.begin() + index);
        // Remove the column at `index` from the adjacency matrix
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* Add edge */
    // Parameters i, j correspond to vertices element indices
    void addEdge(int i, int j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Vertex does not exist");
        }
        // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., satisfies (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Remove edge */
    // Parameters i, j correspond to vertices element indices
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
    /* Initialize undirected graph */
    // Edges elements represent vertex indices
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\nAfter initialization, the graph is" << endl;
    graph.print();

    /* Add edge */
    // Indices of vertices 1, 2 are 0, 2 respectively
    graph.addEdge(0, 2);
    cout << "\nAfter adding edge 1-2, the graph is" << endl;
    graph.print();

    /* Remove edge */
    // Indices of vertices 1, 3 are 0, 1 respectively
    graph.removeEdge(0, 1);
    cout << "\nAfter removing edge 1-3, the graph is" << endl;
    graph.print();

    /* Add vertex */
    graph.addVertex(6);
    cout << "\nAfter adding vertex 6, the graph is" << endl;
    graph.print();

    /* Remove vertex */
    // Index of vertex 3 is 1
    graph.removeVertex(1);
    cout << "\nAfter removing vertex 3, the graph is" << endl;
    graph.print();

    return 0;
}
