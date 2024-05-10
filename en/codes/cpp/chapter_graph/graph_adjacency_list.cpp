/**
 * File: graph_adjacency_list.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Undirected graph class based on adjacency list */
class GraphAdjList {
  public:
    // Adjacency list, key: vertex, value: all adjacent vertices of that vertex
    unordered_map<Vertex *, vector<Vertex *>> adjList;

    /* Remove a specified node from vector */
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

    /* Add edge */
    void addEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("Vertex does not exist");
        // Add edge vet1 - vet2
        adjList[vet1].push_back(vet2);
        adjList[vet2].push_back(vet1);
    }

    /* Remove edge */
    void removeEdge(Vertex *vet1, Vertex *vet2) {
        if (!adjList.count(vet1) || !adjList.count(vet2) || vet1 == vet2)
            throw invalid_argument("Vertex does not exist");
        // Remove edge vet1 - vet2
        remove(adjList[vet1], vet2);
        remove(adjList[vet2], vet1);
    }

    /* Add vertex */
    void addVertex(Vertex *vet) {
        if (adjList.count(vet))
            return;
        // Add a new linked list to the adjacency list
        adjList[vet] = vector<Vertex *>();
    }

    /* Remove vertex */
    void removeVertex(Vertex *vet) {
        if (!adjList.count(vet))
            throw invalid_argument("Vertex does not exist");
        // Remove the vertex vet's corresponding linked list from the adjacency list
        adjList.erase(vet);
        // Traverse other vertices' linked lists, removing all edges containing vet
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

// See test case in graph_adjacency_list_test.cpp
