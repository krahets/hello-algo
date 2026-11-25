/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Breadth-first traversal */
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // Vertex traversal order
    vector<Vertex *> res;
    // Use a hash set to track visited vertices
    unordered_set<Vertex *> visited = {startVet};
    // Use a queue for BFS
    queue<Vertex *> que;
    que.push(startVet);
    // Starting at vertex vet, loop until all reachable vertices have been visited
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // Dequeue the front vertex
        res.push_back(vet); // Record the visited vertex
        // Iterate over all neighbors of this vertex
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // Skip visited vertices
            que.push(adjVet);        // Enqueue only unvisited vertices
            visited.emplace(adjVet); // Mark the vertex as visited
        }
    }
    // Return the vertex traversal order
    return res;
}

/* Driver code */
int main() {
    /* Initialize an undirected graph */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\nGraph after initialization:\\n";
    graph.print();

    /* Breadth-first traversal */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\nBreadth-first search (BFS) visits the vertices in this order:" << endl;
    printVector(vetsToVals(res));

    // Free the memory
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
