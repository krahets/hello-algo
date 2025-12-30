/**
 * File: graph_adjacency_list_test.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp), krahets (krahets@163.com)
 */

#include "./graph_adjacency_list.cpp"

/* Driver Code */
int main() {
    /* Add edge */
    vector<Vertex *> v = valsToVets(vector<int>{1, 3, 2, 5, 4});
    vector<vector<Vertex *>> edges = {{v[0], v[1]}, {v[0], v[3]}, {v[1], v[2]},
                                      {v[2], v[3]}, {v[2], v[4]}, {v[3], v[4]}};
    GraphAdjList graph(edges);
    cout << "\nAfter initialization, graph is" << endl;
    graph.print();

    /* Add edge */
    // Vertices 1, 3 are v[0], v[1]
    graph.addEdge(v[0], v[2]);
    cout << "\nAfter adding edge 1-2, graph is" << endl;
    graph.print();

    /* Remove edge */
    // Vertex 3 is v[1]
    graph.removeEdge(v[0], v[1]);
    cout << "\nAfter removing edge 1-3, graph is" << endl;
    graph.print();

    /* Add vertex */
    Vertex *v5 = new Vertex(6);
    graph.addVertex(v5);
    cout << "\nAfter adding vertex 6, graph is" << endl;
    graph.print();

    /* Remove vertex */
    // Vertex 3 is v[1]
    graph.removeVertex(v[1]);
    cout << "\nAfter removing vertex 3, graph is" << endl;
    graph.print();

    // Free memory
    for (Vertex *vet : v) {
        delete vet;
    }

    return 0;
}
