/**
 * File: graph_dfs.ts
 * Created Time: 2023-02-21
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { Vertex } from '../modules/Vertex';
import { GraphAdjList } from './graph_adjacency_list';

/* Depth-first traversal helper function */
function dfs(
    graph: GraphAdjList,
    visited: Set<Vertex>,
    res: Vertex[],
    vet: Vertex
): void {
    res.push(vet); // Record visited vertex
    visited.add(vet); // Mark this vertex as visited
    // Traverse all adjacent vertices of this vertex
    for (const adjVet of graph.adjList.get(vet)) {
        if (visited.has(adjVet)) {
            continue; // Skip vertices that have been visited
        }
        // Recursively visit adjacent vertices
        dfs(graph, visited, res, adjVet);
    }
}

/* Depth-first traversal */
// Use adjacency list to represent the graph, in order to obtain all adjacent vertices of a specified vertex
function graphDFS(graph: GraphAdjList, startVet: Vertex): Vertex[] {
    // Vertex traversal sequence
    const res: Vertex[] = [];
    // Hash set for recording vertices that have been visited
    const visited: Set<Vertex> = new Set();
    dfs(graph, visited, res, startVet);
    return res;
}

/* Driver Code */
/* Add edge */
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
console.log('\nAfter initialization, graph is');
graph.print();

/* Depth-first traversal */
const res = graphDFS(graph, v[0]);
console.log('\nDepth-first traversal (DFS) vertex sequence is');
console.log(Vertex.vetsToVals(res));
