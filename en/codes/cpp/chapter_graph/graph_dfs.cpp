/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Depth-first traversal helper function */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // Record visited vertex
    visited.emplace(vet); // Mark the vertex as visited
    // Traverse all adjacent vertices of that vertex
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // Skip already visited vertices
        // Recursively visit adjacent vertices
        dfs(graph, visited, res, adjVet);
    }
}

/* Depth-first traversal */
// Use adjacency list to represent the graph, to obtain all adjacent vertices of a specified vertex
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // Vertex traversal sequence
    vector<Vertex *> res;
    // Hash set, used to record visited vertices
    unordered_set<Vertex *> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
int main() {
    /* Initialize undirected graph */
    vector<Vertex *> v = valsToVets(vector<int>{0, 1, 2, 3, 4, 5, 6});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    GraphAdjList graph(edges);
    cout << "\nAfter initialization, the graph is" << endl;
    graph.print();

    /* Depth-first traversal */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\nDepth-first traversal (DFS) vertex sequence is" << endl;
    printVector(vetsToVals(res));

    // Free memory
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
