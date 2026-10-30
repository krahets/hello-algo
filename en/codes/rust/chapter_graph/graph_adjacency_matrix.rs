/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* Undirected graph type implemented with an adjacency matrix */
pub struct GraphAdjMat {
    // Vertex list: elements are vertex values, and indices are vertex indices
    pub vertices: Vec<i32>,
    // Adjacency matrix: row and column indices correspond to vertex indices
    pub adj_mat: Vec<Vec<i32>>,
}

impl GraphAdjMat {
    /* Constructor */
    pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
        let mut graph = GraphAdjMat {
            vertices: vec![],
            adj_mat: vec![],
        };
        // Add a vertex
        for val in vertices {
            graph.add_vertex(val);
        }
        // Add an edge
        // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* Get the number of vertices */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* Add a vertex */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // Append the new vertex value to the vertex list
        self.vertices.push(val);
        // Add a row to the adjacency matrix
        self.adj_mat.push(vec![0; n]);
        // Add a column to the adjacency matrix
        for row in self.adj_mat.iter_mut() {
            row.push(0);
        }
    }

    /* Remove a vertex */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("Invalid vertex index")
        }
        // Remove the vertex at index `index` from the vertex list
        self.vertices.remove(index);
        // Remove row `index` from the adjacency matrix
        self.adj_mat.remove(index);
        // Remove column `index` from the adjacency matrix
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* Add an edge */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // Parameters i and j are element indices in vertices
        // Handle out-of-bounds or equal indices
        if i >= self.size() || j >= self.size() || i == j {
            panic!("Invalid vertex index")
        }
        // For an undirected graph, the adjacency matrix is symmetric about its main diagonal: entries (i, j) and (j, i) are equal
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* Remove an edge */
    // Parameters i and j are element indices in vertices
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // Parameters i and j are element indices in vertices
        // Handle out-of-bounds or equal indices
        if i >= self.size() || j >= self.size() || i == j {
            panic!("Invalid vertex index")
        }
        self.adj_mat[i][j] = 0;
        self.adj_mat[j][i] = 0;
    }

    /* Print the adjacency matrix */
    pub fn print(&self) {
        println!("Vertex list = {:?}", self.vertices);
        println!("Adjacency matrix =");
        println!("[");
        for row in &self.adj_mat {
            println!("  {:?},", row);
        }
        println!("]")
    }
}

/* Driver code */
fn main() {
    /* Initialize the undirected graph */
    // Note that the entries in edges are vertex indices, corresponding to element indices in vertices
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\nGraph after initialization:");
    graph.print();

    /* Add an edge */
    // Vertices 1 and 2 have indices 0 and 2, respectively
    graph.add_edge(0, 2);
    println!("\nGraph after adding edge 1-2:");
    graph.print();

    /* Remove an edge */
    // Vertices 1 and 3 have indices 0 and 1, respectively
    graph.remove_edge(0, 1);
    println!("\nGraph after removing edge 1-3:");
    graph.print();

    /* Add a vertex */
    graph.add_vertex(6);
    println!("\nGraph after adding vertex 6:");
    graph.print();

    /* Remove a vertex */
    // Vertex 3 has index 1
    graph.remove_vertex(1);
    println!("\nGraph after removing vertex 3:");
    graph.print();
}
