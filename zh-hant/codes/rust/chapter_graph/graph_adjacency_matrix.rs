/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* 基於鄰接矩陣實現的無向圖型別 */
pub struct GraphAdjMat {
    // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
    pub vertices: Vec<i32>,
    // 鄰接矩陣，行列索引對應“頂點索引”
    pub adj_mat: Vec<Vec<i32>>,
}

impl GraphAdjMat {
    /* 建構子 */
    pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
        let mut graph = GraphAdjMat {
            vertices: vec![],
            adj_mat: vec![],
        };
        // 新增頂點
        for val in vertices {
            graph.add_vertex(val);
        }
        // 新增邊
        // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* 獲取頂點數量 */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* 新增頂點 */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // 向頂點串列中新增新頂點的值
        self.vertices.push(val);
        // 在鄰接矩陣中新增一行
        self.adj_mat.push(vec![0; n]);
        // 在鄰接矩陣中新增一列
        for row in &mut self.adj_mat {
            row.push(0);
        }
    }

    /* 刪除頂點 */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("index error")
        }
        // 在頂點串列中移除索引 index 的頂點
        self.vertices.remove(index);
        // 在鄰接矩陣中刪除索引 index 的行
        self.adj_mat.remove(index);
        // 在鄰接矩陣中刪除索引 index 的列
        for row in &mut self.adj_mat {
            row.remove(index);
        }
    }

    /* 新增邊 */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // 參數 i, j 對應 vertices 元素索引
        // 索引越界與相等處理
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* 刪除邊 */
    // 參數 i, j 對應 vertices 元素索引
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // 參數 i, j 對應 vertices 元素索引
        // 索引越界與相等處理
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        self.adj_mat[i][j] = 0;
        self.adj_mat[j][i] = 0;
    }

    /* 列印鄰接矩陣 */
    pub fn print(&self) {
        println!("頂點串列 = {:?}", self.vertices);
        println!("鄰接矩陣 =");
        println!("[");
        for row in &self.adj_mat {
            println!("  {:?},", row);
        }
        println!("]")
    }
}

/* Driver Code */
fn main() {
    /* 初始化無向圖 */
    // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\n初始化後，圖為");
    graph.print();

    /* 新增邊 */
    // 頂點 1, 2 的索引分別為 0, 2
    graph.add_edge(0, 2);
    println!("\n新增邊 1-2 後，圖為");
    graph.print();

    /* 刪除邊 */
    // 頂點 1, 3 的索引分別為 0, 1
    graph.remove_edge(0, 1);
    println!("\n刪除邊 1-3 後，圖為");
    graph.print();

    /* 新增頂點 */
    graph.add_vertex(6);
    println!("\n新增頂點 6 後，圖為");
    graph.print();

    /* 刪除頂點 */
    // 頂點 3 的索引為 1
    graph.remove_vertex(1);
    println!("\n刪除頂點 3 後，圖為");
    graph.print();
}
