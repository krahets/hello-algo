/**
 * File: graph_adjacency_list.ts
 * Created Time: 2023-02-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { Vertex } from '../modules/Vertex';

/* Undirected graph class implemented with an adjacency list */
class GraphAdjList {
    // Adjacency list: key is a vertex, value is the list of all its neighbors
    adjList: Map<Vertex, Vertex[]>;

    /* Constructor */
    constructor(edges: Vertex[][]) {
        this.adjList = new Map();
        // Add all vertices and edges
        for (const edge of edges) {
            this.addVertex(edge[0]);
            this.addVertex(edge[1]);
            this.addEdge(edge[0], edge[1]);
        }
    }

    /* Get the number of vertices */
    size(): number {
        return this.adjList.size;
    }

    /* Add an edge */
    addEdge(vet1: Vertex, vet2: Vertex): void {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2
        ) {
            throw new Error('Invalid argument');
        }
        // Add edge vet1 - vet2
        this.adjList.get(vet1).push(vet2);
        this.adjList.get(vet2).push(vet1);
    }

    /* Remove an edge */
    removeEdge(vet1: Vertex, vet2: Vertex): void {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2 ||
            this.adjList.get(vet1).indexOf(vet2) === -1
        ) {
            throw new Error('Invalid argument');
        }
        // Remove edge vet1 - vet2
        this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
        this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
    }

    /* Add a vertex */
    addVertex(vet: Vertex): void {
        if (this.adjList.has(vet)) return;
        // Add a new list to the adjacency list
        this.adjList.set(vet, []);
    }

    /* Remove a vertex */
    removeVertex(vet: Vertex): void {
        if (!this.adjList.has(vet)) {
            throw new Error('Invalid argument');
        }
        // Remove the list corresponding to vertex vet from the adjacency list
        this.adjList.delete(vet);
        // Traverse the lists of the other vertices and remove all edges incident to vet
        for (const set of this.adjList.values()) {
            const index: number = set.indexOf(vet);
            if (index > -1) {
                set.splice(index, 1);
            }
        }
    }

    /* Print the adjacency list */
    print(): void {
        console.log('Adjacency list =');
        for (const [key, value] of this.adjList.entries()) {
            const tmp = [];
            for (const vertex of value) {
                tmp.push(vertex.val);
            }
            console.log(key.val + ': ' + tmp.join());
        }
    }
}

/* Driver code */
if (import.meta.url.endsWith(process.argv[1])) {
    /* Initialize the undirected graph */
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
    // Vertices 1 and 2 are v0 and v2
    graph.addEdge(v0, v2);
    console.log('\nGraph after adding edge 1-2:');
    graph.print();

    /* Remove an edge */
    // Vertices 1 and 3 are v0 and v1
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

export { GraphAdjList };
