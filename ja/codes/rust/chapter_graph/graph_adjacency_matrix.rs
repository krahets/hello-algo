/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* 隣接行列に基づく無向グラフ型 */
pub struct GraphAdjMat {
    // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
    pub vertices: Vec<i32>,
    // 隣接行列。行・列のインデックスは「頂点インデックス」に対応
    pub adj_mat: Vec<Vec<i32>>,
}

impl GraphAdjMat {
    /* コンストラクタ */
    pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
        let mut graph = GraphAdjMat {
            vertices: vec![],
            adj_mat: vec![],
        };
        // 頂点を追加
        for val in vertices {
            graph.add_vertex(val);
        }
        // 辺を追加
        // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* 頂点数を取得 */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* 頂点を追加 */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // 頂点リストに新しい頂点の値を追加
        self.vertices.push(val);
        // 隣接行列に 1 行追加
        self.adj_mat.push(vec![0; n]);
        // 隣接行列に 1 列追加
        for row in self.adj_mat.iter_mut() {
            row.push(0);
        }
    }

    /* 頂点を削除 */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("index error")
        }
        // 頂点リストから index の頂点を削除する
        self.vertices.remove(index);
        // 隣接行列で index 行を削除する
        self.adj_mat.remove(index);
        // 隣接行列で index 列を削除する
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* 辺を追加 */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // パラメータ i, j は vertices の要素インデックスに対応する
        // 範囲外と同値の場合の処理
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        // 無向グラフでは、隣接行列は主対角線に関して対称、すなわち (i, j) == (j, i) を満たす
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* 辺を削除 */
    // 引数 i, j は vertices の要素インデックスに対応する
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // パラメータ i, j は vertices の要素インデックスに対応する
        // 範囲外と同値の場合の処理
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        self.adj_mat[i][j] = 0;
        self.adj_mat[j][i] = 0;
    }

    /* 隣接行列を出力 */
    pub fn print(&self) {
        println!("頂点リスト = {:?}", self.vertices);
        println!("隣接行列 =");
        println!("[");
        for row in &self.adj_mat {
            println!("  {:?},", row);
        }
        println!("]")
    }
}

/* Driver Code */
fn main() {
    /* 無向グラフを初期化 */
    // edges の要素は頂点インデックス、すなわち vertices の要素インデックスに対応する点に注意
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\n初期化後、グラフは");
    graph.print();

    /* 辺を追加 */
    // 頂点 1, 2 のインデックスはそれぞれ 0, 2
    graph.add_edge(0, 2);
    println!("\n辺 1-2 を追加した後、グラフは");
    graph.print();

    /* 辺を削除 */
    // 頂点 1, 3 のインデックスはそれぞれ 0, 1
    graph.remove_edge(0, 1);
    println!("\n辺 1-3 を削除した後、グラフは");
    graph.print();

    /* 頂点を追加 */
    graph.add_vertex(6);
    println!("\n頂点 6 を追加した後、グラフは");
    graph.print();

    /* 頂点を削除 */
    // 頂点 3 のインデックスは 1
    graph.remove_vertex(1);
    println!("\n頂点 3 を削除した後、グラフは");
    graph.print();
}
