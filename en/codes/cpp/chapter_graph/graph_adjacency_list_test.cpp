/**
 * File: graph_adjacency_list_test.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "./graph_adjacency_list.cpp"

/* Driver code */
int main() {
    /* Initialize the undirected graph */
    vector<Vertex *> v = valsToVets(vector<int>{1, 3, 2, 5, 4});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    GraphAdjList graph(edges);
    cout << "\nGraph after initialization:" << endl;
    graph.print();

    /* Add an edge */
    // Vertices 1 and 2 are v[0] and v[2]
    graph.addEdge(v[0], v[2]);
    cout << "\nGraph after adding edge 1-2:" << endl;
    graph.print();

    /* Remove an edge */
    // Vertices 1 and 3 are v[0] and v[1]
    graph.removeEdge(v[0], v[1]);
    cout << "\nGraph after removing edge 1-3:" << endl;
    graph.print();

    /* Add a vertex */
    Vertex *v5 = new Vertex(6);
    graph.addVertex(v5);
    cout << "\nGraph after adding vertex 6:" << endl;
    graph.print();

    /* Remove a vertex */
    // Vertex 3 is v[1]
    graph.removeVertex(v[1]);
    cout << "\nGraph after removing vertex 3:" << endl;
    graph.print();

    // Free memory
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
