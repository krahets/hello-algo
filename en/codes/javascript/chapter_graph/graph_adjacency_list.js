/**
 * File: graph_adjacency_list.js
 * Created Time: 2023-02-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { Vertex } = require('../modules/Vertex');

/* Undirected graph represented by an adjacency list */
class GraphAdjList {
    // Adjacency list: each vertex maps to its neighbors
    adjList;

    /* Constructor */
    constructor(edges) {
        this.adjList = new Map();
        // Add all vertices and edges
        for (const edge of edges) {
            this.addVertex(edge[0]);
            this.addVertex(edge[1]);
            this.addEdge(edge[0], edge[1]);
        }
    }

    /* Get the vertex count */
    size() {
        return this.adjList.size;
    }

    /* Add an edge */
    addEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2
        ) {
            throw new Error('Illegal Argument Exception');
        }
        // Add the edge vet1 - vet2
        this.adjList.get(vet1).push(vet2);
        this.adjList.get(vet2).push(vet1);
    }

    /* Remove an edge */
    removeEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2 ||
            this.adjList.get(vet1).indexOf(vet2) === -1
        ) {
            throw new Error('Illegal Argument Exception');
        }
        // Remove the edge vet1 - vet2
        this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
        this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
    }

    /* Add a vertex */
    addVertex(vet) {
        if (this.adjList.has(vet)) return;
        // Add a new linked list to the adjacency list
        this.adjList.set(vet, []);
    }

    /* Remove a vertex */
    removeVertex(vet) {
        if (!this.adjList.has(vet)) {
            throw new Error('Illegal Argument Exception');
        }
        // Remove the linked list for vertex vet from the adjacency list
        this.adjList.delete(vet);
        // Traverse the other vertices' lists and remove every edge incident to vet
        for (const set of this.adjList.values()) {
            const index = set.indexOf(vet);
            if (index > -1) {
                set.splice(index, 1);
            }
        }
    }

    /* Print the adjacency list */
    print() {
        console.log('Adjacency list =');
        for (const [key, value] of this.adjList) {
            const tmp = [];
            for (const vertex of value) {
                tmp.push(vertex.val);
            }
            console.log(key.val + ': ' + tmp.join());
        }
    }
}

if (require.main === module) {
    /* Driver code */
    /* Initialize an undirected graph */
    const v0 = new Vertex(1),
        v1 = new Vertex(3),
        v2 = new Vertex(2),
        v3 = new Vertex(5),
        v4 = new Vertex(4);
    const edges = [
        [v0, v1],
        [v1, v2],
        [v2, v3],
        [v0, v3],
        [v2, v4],
        [v3, v4],
    ];
    const graph = new GraphAdjList(edges);
    console.log('\nGraph after initialization:');
    graph.print();

    /* Add an edge */
    // Vertices 1 and 2 are v0 and v2, respectively
    graph.addEdge(v0, v2);
    console.log('\nGraph after adding edge 1-2:');
    graph.print();

    /* Remove an edge */
    // Vertices 1 and 3 are v0 and v1, respectively
    graph.removeEdge(v0, v1);
    console.log('\nGraph after removing edge 1-3:');
    graph.print();

    /* Add a vertex */
    const v5 = new Vertex(6);
    graph.addVertex(v5);
    console.log('\nGraph after adding vertex 6:');
    graph.print();

    /* Remove a vertex */
    // Vertex 3 is v1
    graph.removeVertex(v1);
    console.log('\nGraph after removing vertex 3:');
    graph.print();
}

module.exports = {
    GraphAdjList,
};
