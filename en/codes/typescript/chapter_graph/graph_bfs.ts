/**
 * File: graph_bfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { GraphAdjList } from './graph_adjacency_list';
import { Vertex } from '../modules/Vertex';

/* Breadth-first traversal */
// Represent the graph with an adjacency list to access all neighbors of a given vertex
function graphBFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // Vertex traversal sequence
    const res: Vertex[] = [];
    // Hash set recording visited vertices
    const visited: Set<Vertex> = new Set();
    visited.add(startVet);
    // Use a queue to implement BFS
    const que = [startVet];
    // Starting from startVet, loop until all reachable vertices have been visited
    while (que.length) {
        const vet = que.shift(); // Dequeue the front vertex
        res.push(vet); // Record the visited vertex
        // Traverse all neighbors of this vertex
        for (const adjVet of graph.adjList.get(vet) ?? []) {
            if (visited.has(adjVet)) {
                continue; // Skip vertices that have already been visited
            }
            que.push(adjVet); // Enqueue only unvisited vertices
            visited.add(adjVet); // Mark this vertex as visited
        }
    }
    // Return the vertex traversal sequence
    return res;
}

/* Driver code */
/* Initialize the undirected graph */
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
console.log('\nVertex sequence from breadth-first traversal (BFS):');
console.log(Vertex.vetsToVals(res));
