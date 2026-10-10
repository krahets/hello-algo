/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Breadth-first traversal */
// Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // Vertex traversal sequence
    vector<Vertex *> res;
    // Hash set for recording vertices that have been visited
    unordered_set<Vertex *> visited = {startVet};
    // Queue used to implement BFS
    queue<Vertex *> que;
    que.push(startVet);
    // Starting from vertex vet, loop until all vertices are visited
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // Dequeue the front vertex
        res.push_back(vet); // Record visited vertex
        // Traverse all adjacent vertices of this vertex
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // Skip vertices that have been visited
            que.push(adjVet);        // Only enqueue unvisited vertices
            visited.emplace(adjVet); // Mark this vertex as visited
        }
    }
    // Return vertex traversal sequence
    return res;
}

/* Driver Code */
int main() {
    /* Add edge */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\nAfter initialization, graph is\\n";
    graph.print();

    /* Breadth-first traversal */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\nBreadth-first traversal (BFS) vertex sequence is" << endl;
    printVector(vetsToVals(res));

    // Free memory
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
