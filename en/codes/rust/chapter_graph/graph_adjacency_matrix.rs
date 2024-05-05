/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* Type of undirected graph implemented based on adjacency matrix */
pub struct GraphAdjMat {
    // Vertex list, elements represent "vertex value", index represents "vertex index"
    pub vertices: Vec<i32>,
    // Adjacency matrix, row and column indices correspond to "vertex index"
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
        // Please note, edges elements represent vertex indices, corresponding to vertices elements indices
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
        // Add new vertex value to the vertex list
        self.vertices.push(val);
        // Add a row to the adjacency matrix
        self.adj_mat.push(vec![0; n]);
        // Add a column to the adjacency matrix
        for row in &mut self.adj_mat {
            row.push(0);
        }
    }

    /* Remove vertex */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("index error")
        }
        // Remove vertex at `index` from the vertex list
        self.vertices.remove(index);
        // Remove the row at `index` from the adjacency matrix
        self.adj_mat.remove(index);
        // Remove the column at `index` from the adjacency matrix
        for row in &mut self.adj_mat {
            row.remove(index);
        }
    }

    /* Add edge */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // Parameters i, j correspond to vertices element indices
        // Handle index out of bounds and equality
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        // In an undirected graph, the adjacency matrix is symmetric about the main diagonal, i.e., satisfies (i, j) == (j, i)
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* Remove edge */
    // Parameters i, j correspond to vertices element indices
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // Parameters i, j correspond to vertices element indices
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
    /* Initialize undirected graph */
    // Please note, edges elements represent vertex indices, corresponding to vertices elements indices
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\nAfter initialization, the graph is");
    graph.print();

    /* Add edge */
    // Indices of vertices 1, 2 are 0, 2 respectively
    graph.add_edge(0, 2);
    println!("\nAfter adding edge 1-2, the graph is");
    graph.print();

    /* Remove edge */
    // Indices of vertices 1, 3 are 0, 1 respectively
    graph.remove_edge(0, 1);
    println!("\nAfter removing edge 1-3, the graph is");
    graph.print();

    /* Add vertex */
    graph.add_vertex(6);
    println!("\nAfter adding vertex 6, the graph is");
    graph.print();

    /* Remove vertex */
    // Index of vertex 3 is 1
    graph.remove_vertex(1);
    println!("\nAfter removing vertex 3, the graph is");
    graph.print();
}
