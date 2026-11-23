/**
 * File: graph_dfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Depth-first traversal helper function */
void dfs(GraphAdjList &graph, unordered_set<Vertex *> &visited, vector<Vertex *> &res, Vertex *vet) {
    res.push_back(vet);   // Record the visited vertex
    visited.emplace(vet); // Mark this vertex as visited
    // Traverse all neighbors of this vertex
    for (Vertex *adjVet : graph.adjList[vet]) {
        if (visited.count(adjVet))
            continue; // Skip vertices that have already been visited
        // Recursively visit the neighboring vertex
        dfs(graph, visited, res, adjVet);
    }
}

/* Depth-first traversal */
// Represent the graph with an adjacency list to access all neighbors of a given vertex
vector<Vertex *> graphDFS(GraphAdjList &graph, Vertex *startVet) {
    // Vertex traversal sequence
    vector<Vertex *> res;
    // Hash set recording visited vertices
    unordered_set<Vertex *> visited;
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver code */
int main() {
    /* Initialize the undirected graph */
    vector<Vertex *> v = valsToVets(vector<int>{0, 1, 2, 3, 4, 5, 6});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[5]}, {v[4], v[5]}, {v[5], v[6]}};
    GraphAdjList graph(edges);
    cout << "\nGraph after initialization:" << endl;
    graph.print();

    /* Depth-first traversal */
    vector<Vertex *> res = graphDFS(graph, v[0]);
    cout << "\nVertex sequence from depth-first traversal (DFS):" << endl;
    printVector(vetsToVals(res));

    // Free memory
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
