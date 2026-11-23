/**
 * File: graph_bfs.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"
#include "./graph_adjacency_list.cpp"

/* Breadth-first traversal */
// Represent the graph with an adjacency list to access all neighbors of a given vertex
vector<Vertex *> graphBFS(GraphAdjList &graph, Vertex *startVet) {
    // Vertex traversal sequence
    vector<Vertex *> res;
    // Hash set recording visited vertices
    unordered_set<Vertex *> visited = {startVet};
    // Use a queue to implement BFS
    queue<Vertex *> que;
    que.push(startVet);
    // Starting from startVet, continue until all reachable vertices have been visited
    while (!que.empty()) {
        Vertex *vet = que.front();
        que.pop();          // Dequeue the front vertex
        res.push_back(vet); // Record the visited vertex
        // Traverse all neighbors of this vertex
        for (auto adjVet : graph.adjList[vet]) {
            if (visited.count(adjVet))
                continue;            // Skip vertices that have already been visited
            que.push(adjVet);        // Enqueue only unvisited vertices
            visited.emplace(adjVet); // Mark this vertex as visited
        }
    }
    // Return the vertex traversal sequence
    return res;
}

/* Driver code */
int main() {
    /* Initialize the undirected graph */
    vector<Vertex *> v = valsToVets({0, 1, 2, 3, 4, 5, 6, 7, 8, 9});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]}, {v[1], v[4]},
                                      {v[2], v[5]}, {v[3], v[4]}, {v[3], v[6]}, {v[4], v[5]},
                                      {v[4], v[7]}, {v[5], v[8]}, {v[6], v[7]}, {v[7], v[8]}};
    GraphAdjList graph(edges);
    cout << "\nGraph after initialization:\\n";
    graph.print();

    /* Breadth-first traversal */
    vector<Vertex *> res = graphBFS(graph, v[0]);
    cout << "\nVertex sequence from breadth-first traversal (BFS):" << endl;
    printVector(vetsToVals(res));

    // Free memory
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
