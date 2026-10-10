/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* Undirected graph type based on adjacency matrix */
pub struct GraphAdjMat {
    // Vertex list, where the element represents the "vertex value" and the index represents the "vertex index"
    pub vertices: Vec<i32>,
    // Adjacency matrix, where the row and column indices correspond to the "vertex index"
    pub adj_mat: Vec<Vec<i32>>,
}

impl GraphAdjMat {
    /* Constructor */
    pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
        let mut graph = GraphAdjMat {
            vertices: vec![],
            adj_mat: vec![],
        };
        // Add vertex
        for val in vertices {
            graph.add_vertex(val);
        }
        // Add edge
        // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* Get the number of vertices */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* Add vertex */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // Add the value of the new vertex to the vertex list
        self.vertices.push(val);
        // Add a row to the adjacency matrix
        self.adj_mat.push(vec![0; n]);
        // Add a column to the adjacency matrix
        for row in self.adj_mat.iter_mut() {
            row.push(0);
        }
    }

    /* Remove vertex */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("index error")
        }
        // Remove the vertex at index from the vertex list
        self.vertices.remove(index);
        // Remove the row at index from the adjacency matrix
        self.adj_mat.remove(index);
        // Remove the column at index from the adjacency matrix
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* Add edge */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // Parameters i, j correspond to the vertices element indices
        // Handle index out of bounds and equality
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., (i, j) == (j, i)
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* Remove edge */
    // Parameters i, j correspond to the vertices element indices
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // Parameters i, j correspond to the vertices element indices
        // Handle index out of bounds and equality
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        self.adj_mat[i][j] = 0;
        self.adj_mat[j][i] = 0;
    }

    /* Print adjacency matrix */
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

/* Driver Code */
fn main() {
    /* Add edge */
    // Note that the edges elements represent vertex indices, i.e., corresponding to the vertices element indices
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\nAfter initialization, graph is");
    graph.print();

    /* Add edge */
    // Add vertex
    graph.add_edge(0, 2);
    println!("\nAfter adding edge 1-2, graph is");
    graph.print();

    /* Remove edge */
    // Vertices 1, 3 have indices 0, 1 respectively
    graph.remove_edge(0, 1);
    println!("\nAfter removing edge 1-3, graph is");
    graph.print();

    /* Add vertex */
    graph.add_vertex(6);
    println!("\nAfter adding vertex 6, graph is");
    graph.print();

    /* Remove vertex */
    // Vertex 3 has index 1
    graph.remove_vertex(1);
    println!("\nAfter removing vertex 3, graph is");
    graph.print();
}
