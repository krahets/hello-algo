/**
 * File: graph_dfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { Vertex } from '../modules/Vertex';
import { GraphAdjList } from './graph_adjacency_list';

/* Helper for depth-first traversal */
function dfs(
    graph: GraphAdjList,
    visited: Set<Vertex>,
    res: Vertex[],
    vet: Vertex
): void {
    res.push(vet); // Record the visited vertex
    visited.add(vet); // Mark the vertex as visited
    // Iterate over all neighbors of this vertex
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // Skip visited vertices
        }
        // Visit neighbors recursively
        dfs(graph, visited, res, adjVet);
    }
}

/* Depth-first traversal */
// Represent the graph with an adjacency list to look up all neighbors of a given vertex
function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // Vertex traversal order
    const res: Vertex[] = [];
    // Use a hash set to track visited vertices
    const visited: Set<Vertex> = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver code */
/* Initialize an undirected graph */
const v = Vertex.valsToVets([0, 1, 2, 3, 4, 5, 6]);
const edges = [
    [v[0], v[1]],
    [v[0], v[3]],
    [v[1], v[2]],
    [v[2], v[5]],
    [v[4], v[5]],
    [v[5], v[6]],
];
const graph = new GraphAdjList(edges);
console.log('\nGraph after initialization:');
graph.print();

/* Depth-first traversal */
const res = graphDFS(graph, v[0]);
console.log('\nDepth-first search (DFS) visits the vertices in this order:');
console.log(Vertex.vetsToVals(res));
