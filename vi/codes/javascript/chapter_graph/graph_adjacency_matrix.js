/**
 * File: graph_adjacency_matrix.js
 * Created Time: 2023-02-09
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Undirected graph class based on adjacency matrix */
class GraphAdjMat {
    vertices; // Vertex list, where the element represents the "vertex value" and the index represents the "vertex index"
    adjMat; // Adjacency matrix, where the row and column indices correspond to the "vertex index"

    /* Constructor */
    constructor(vertices, edges) {
        this.vertices = [];
        this.adjMat = [];
        // Add vertex
        for (const val of vertices) {
            this.addVertex(val);
        }
        // Add edge
        // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
        for (const e of edges) {
            this.addEdge(e[0], e[1]);
        }
    }

    /* Get the number of vertices */
    size() {
        return this.vertices.length;
    }

    /* Add vertex */
    addVertex(val) {
        const n = this.size();
        // Add the value of the new vertex to the vertex list
        this.vertices.push(val);
        // Add a row to the adjacency matrix
        const newRow = [];
        for (let j = 0; j < n; j++) {
            newRow.push(0);
        }
        this.adjMat.push(newRow);
        // Add a column to the adjacency matrix
        for (const row of this.adjMat) {
            row.push(0);
        }
    }

    /* Remove vertex */
    removeVertex(index) {
        if (index >= this.size()) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // Remove the vertex at index from the vertex list
        this.vertices.splice(index, 1);

        // Remove the row at index from the adjacency matrix
        this.adjMat.splice(index, 1);
        // Remove the column at index from the adjacency matrix
        for (const row of this.adjMat) {
            row.splice(index, 1);
        }
    }

    /* Add edge */
    // Parameters i, j correspond to the vertices element indices
    addEdge(i, j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // In undirected graph, adjacency matrix is symmetric about main diagonal, i.e., satisfies (i, j) === (j, i)
        this.adjMat[i][j] = 1;
        this.adjMat[j][i] = 1;
    }

    /* Remove edge */
    // Parameters i, j correspond to the vertices element indices
    removeEdge(i, j) {
        // Handle index out of bounds and equality
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        this.adjMat[i][j] = 0;
        this.adjMat[j][i] = 0;
    }

    /* Print adjacency matrix */
    print() {
        console.log('Vertex list = ', this.vertices);
        console.log('Adjacency matrix =', this.adjMat);
    }
}

/* Driver Code */
/* Add edge */
// Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
const vertices = [1, 3, 2, 5, 4];
const edges = [
    [0, 1],
    [1, 2],
    [2, 3],
    [0, 3],
    [2, 4],
    [3, 4],
];
const graph = new GraphAdjMat(vertices, edges);
console.log('\nAfter initialization, graph is');
graph.print();

/* Add edge */
// Add vertex
graph.addEdge(0, 2);
console.log('\nAfter adding edge 1-2, graph is');
graph.print();

/* Remove edge */
// Vertices 1, 3 have indices 0, 1 respectively
graph.removeEdge(0, 1);
console.log('\nAfter removing edge 1-3, graph is');
graph.print();

/* Add vertex */
graph.addVertex(6);
console.log('\nAfter adding vertex 6, graph is');
graph.print();

/* Remove vertex */
// Vertex 3 has index 1
graph.removeVertex(1);
console.log('\nAfter removing vertex 3, graph is');
graph.print();
