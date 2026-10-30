/**
 * File: graph_adjacency_matrix.js
 * Created Time: 2023-02-09
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Undirected graph class implemented with an adjacency matrix */
class GraphAdjMat {
    vertices; // Vertex list: elements are vertex values, and indices are vertex indices
    adjMat; // Adjacency matrix: row and column indices correspond to vertex indices

    /* Constructor */
    constructor(vertices, edges) {
        this.vertices = [];
        this.adjMat = [];
        // Add a vertex
        for (const val of vertices) {
            this.addVertex(val);
        }
        // Add an edge
        // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
        for (const e of edges) {
            this.addEdge(e[0], e[1]);
        }
    }

    /* Get the number of vertices */
    size() {
        return this.vertices.length;
    }

    /* Add a vertex */
    addVertex(val) {
        const n = this.size();
        // Append the new vertex value to the vertex list
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

    /* Remove a vertex */
    removeVertex(index) {
        if (index >= this.size()) {
            throw new RangeError('Index out of bounds');
        }
        // Remove the vertex at index `index` from the vertex list
        this.vertices.splice(index, 1);

        // Remove row `index` from the adjacency matrix
        this.adjMat.splice(index, 1);
        // Remove column `index` from the adjacency matrix
        for (const row of this.adjMat) {
            row.splice(index, 1);
        }
    }

    /* Add an edge */
    // Parameters i and j are element indices in vertices
    addEdge(i, j) {
        // Handle out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index out of bounds');
        }
        // In an undirected graph, the adjacency matrix is symmetric about its main diagonal: (i, j) === (j, i)
        this.adjMat[i][j] = 1;
        this.adjMat[j][i] = 1;
    }

    /* Remove an edge */
    // Parameters i and j are element indices in vertices
    removeEdge(i, j) {
        // Handle out-of-bounds or equal indices
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index out of bounds');
        }
        this.adjMat[i][j] = 0;
        this.adjMat[j][i] = 0;
    }

    /* Print the adjacency matrix */
    print() {
        console.log('Vertex list = ', this.vertices);
        console.log('Adjacency matrix =', this.adjMat);
    }
}

/* Driver code */
/* Initialize the undirected graph */
// Note that the entries in edges are vertex indices, corresponding to element indices in vertices
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
console.log('\nGraph after initialization:');
graph.print();

/* Add an edge */
// Vertices 1 and 2 have indices 0 and 2, respectively
graph.addEdge(0, 2);
console.log('\nGraph after adding edge 1-2:');
graph.print();

/* Remove an edge */
// Vertices 1 and 3 have indices 0 and 1, respectively
graph.removeEdge(0, 1);
console.log('\nGraph after removing edge 1-3:');
graph.print();

/* Add a vertex */
graph.addVertex(6);
console.log('\nGraph after adding vertex 6:');
graph.print();

/* Remove a vertex */
// Vertex 3 has index 1
graph.removeVertex(1);
console.log('\nGraph after removing vertex 3:');
graph.print();
