/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Undirected graph class implemented with an adjacency list */
class GraphAdjList {
  public:
    // Adjacency list: key is a vertex, value is the list of all its neighbors
    unordered_map<Vertex *, vector<Vertex *>> adjList;

    /* Remove the specified vertex from the vector */
    void remove(vector<Vertex *> &vec, Vertex *vet) {
        for (int i = 0; i < vec.size(); i++) {
            if (vec[i] == vet) {
                vec.erase(vec.begin() + i);
                break;
            }
        }
    }

    /* Constructor */
    GraphAdjList(const vector<vector<Vertex *>> &edges) {
        // Add all vertices and edges
        for (const vector<Vertex *> &edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* Get the number of vertices */
    int size() {
        return adjList.size();
    }

    /* Add an edge */
    void addEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("Invalid vertex");
        // Add edge vet1 - vet2
        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    /* Remove an edge */
    void removeEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("Invalid vertex");
        // Remove edge vet1 - vet2
        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    /* Add a vertex */
    void addVertex(Vertex *vet) {
        if (adjList.count(vet))
            return;
        // Add a new list to the adjacency list
        adjList[vet] = vector<Vertex *>();
    }

    /* Remove a vertex */
    void removeVertex(Vertex *vet) {
        if (!adjList.count(vet))
            throw invalid_argument("Invalid vertex");
        // Remove the list corresponding to vertex vet from the adjacency list
        adjList.erase(vet);
        // Traverse the lists of the other vertices and remove all edges incident to vet
        for (auto &adj : adjList) {
            remove(adj.second, vet);
        }
    }

    /* Print the adjacency list */
    void print() {
        cout << "Adjacency list =" << endl;
        for (auto &adj : adjList) {
            const auto &key = adj.first;
            const auto &vec = adj.second;
            cout << key->val << ": ";
            printVector(vetsToVals(vec));
        }
    }
};

// See graph_adjacency_list_test.cpp for the test example
