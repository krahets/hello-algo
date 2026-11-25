/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* 以鄰接矩陣實作的無向圖型別 */
pub struct GraphAdjMat {
    // 頂點清單，元素代表頂點值，索引代表頂點索引
    pub vertices: Vec<i32>,
    // 鄰接矩陣，橫列與直行的索引皆對應頂點索引
    pub adj_mat: Vec<Vec<i32>>,
}

impl GraphAdjMat {
    /* 建構式 */
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
        // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* 取得頂點數量 */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* 新增頂點 */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // 將新頂點的值加入頂點清單
        self.vertices.push(val);
        // 在鄰接矩陣中新增一個橫列
        self.adj_mat.push(vec![0; n]);
        // 在鄰接矩陣中新增一個直行
        for row in self.adj_mat.iter_mut() {
            row.push(0);
        }
    }

    /* 刪除頂點 */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("index error")
        }
        // 從頂點清單中移除索引為 index 的頂點
        self.vertices.remove(index);
        // 從鄰接矩陣中刪除索引為 index 的橫列
        self.adj_mat.remove(index);
        // 從鄰接矩陣中刪除索引為 index 的直行
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* 新增邊 */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // 參數 i、j 為 vertices 中的元素索引
        // 處理索引超出範圍或兩個索引相同的情形
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* 刪除邊 */
    // 參數 i、j 為 vertices 中的元素索引
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // 參數 i、j 為 vertices 中的元素索引
        // 處理索引超出範圍或兩個索引相同的情形
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        self.adj_mat[i][j] = 0;
        self.adj_mat[j][i] = 0;
    }

    /* 印出鄰接矩陣 */
    pub fn print(&self) {
        println!("頂點清單 = {:?}", self.vertices);
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
    // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\n初始化後的圖為");
    graph.print();

    /* 新增邊 */
    // 頂點 1、2 的索引分別為 0、2
    graph.add_edge(0, 2);
    println!("\n新增邊 1-2 後的圖為");
    graph.print();

    /* 刪除邊 */
    // 頂點 1、3 的索引分別為 0、1
    graph.remove_edge(0, 1);
    println!("\n刪除邊 1-3 後的圖為");
    graph.print();

    /* 新增頂點 */
    graph.add_vertex(6);
    println!("\n新增頂點 6 後的圖為");
    graph.print();

    /* 刪除頂點 */
    // 頂點 3 的索引為 1
    graph.remove_vertex(1);
    println!("\n刪除頂點 3 後的圖為");
    graph.print();
}
