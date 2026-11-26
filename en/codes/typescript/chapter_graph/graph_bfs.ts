/**
 * File: graph_bfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { GraphAdjList } from './graph_adjacency_list';
import { Vertex } from '../modules/Vertex';

/* Breadth-first traversal */
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // Vertex traversal order
    const res: Vertex[] = [];
    // Use a hash set to track visited vertices
    const visited: Set<Vertex> = new Set();
    visited.add(startVet);
    // Use a queue for BFS
    const que = [startVet];
    // Starting at vertex vet, loop until all reachable vertices have been visited
    while (que.length) {
        const vet = que.shift(); // Dequeue the front vertex
        res.push(vet); // Record the visited vertex
        // Iterate over all neighbors of this vertex
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // Skip visited vertices
            }
            que.push(adjVet); // Enqueue only unvisited vertices
            visited.add(adjVet); // Mark the vertex as visited
        }
    }
    // Return the vertex traversal order
    return res;
}

/* Driver code */
/* Initialize an undirected graph */
const v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
const edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[1], v[4]],
    [v[2], v[5]],
    [v[3], v[4]],
    [v[3], v[6]],
    [v[4], v[5]],
    [v[4], v[7]],
    [v[5], v[8]],
    [v[6], v[7]],
    [v[7], v[8]],
];
const graph = new GraphAdjList(edges);
console.log('\nGraph after initialization:');
graph.print();

/* Breadth-first traversal */
const res = graphBFS(graph, v[0]);
console.log('\nBreadth-first search (BFS) visits the vertices in this order:');
console.log(Vertex.vetsToVals(res));
