/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* 隣接行列で実装した無向グラフの型 */
pub struct GraphAdjMat {
    // 頂点リスト。要素は「頂点の値」、インデックスは「頂点のインデックス」を表す
    pub vertices: Vec<i32>,
    // 隣接行列。行と列のインデックスは「頂点のインデックス」に対応する
    pub adj_mat: Vec<Vec<i32>>,
}

impl GraphAdjMat {
    /* コンストラクタ */
    pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
        let mut graph = GraphAdjMat {
            vertices: vec![],
            adj_mat: vec![],
        };
        // 頂点を追加する
        for val in vertices {
            graph.add_vertex(val);
        }
        // 辺を追加する
        // edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* 頂点数を取得する */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* 頂点を追加する */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // 頂点リストに新しい頂点の値を追加する
        self.vertices.push(val);
        // 隣接行列に 1 行追加する
        self.adj_mat.push(vec![0; n]);
        // 隣接行列に 1 列追加する
        for row in self.adj_mat.iter_mut() {
            row.push(0);
        }
    }

    /* 頂点を削除する */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("インデックスのエラー")
        }
        // 頂点リストからインデックス index の頂点を削除する
        self.vertices.remove(index);
        // 隣接行列からインデックス index の行を削除する
        self.adj_mat.remove(index);
        // 隣接行列からインデックス index の列を削除する
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* 辺を追加する */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // 引数 i, j は vertices の要素のインデックスに対応する
        // 添字が範囲外または互いに等しい場合の処理
        if i >= self.size() || j >= self.size() || i == j {
            panic!("インデックスのエラー")
        }
        // 無向グラフの隣接行列は主対角線に関して対称であり、(i, j) == (j, i) を満たす
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* 辺を削除する */
    // 引数 i, j は vertices の要素のインデックスに対応する
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // 引数 i, j は vertices の要素のインデックスに対応する
        // 添字が範囲外または互いに等しい場合の処理
        if i >= self.size() || j >= self.size() || i == j {
            panic!("インデックスのエラー")
        }
        self.adj_mat[i][j] = 0;
        self.adj_mat[j][i] = 0;
    }

    /* 隣接行列を表示する */
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

/* 実行用コード */
fn main() {
    /* 無向グラフを初期化する */
    // edges の要素は頂点のインデックス、すなわち vertices の要素のインデックスを表すことに注意
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\n初期化後のグラフ");
    graph.print();

    /* 辺を追加する */
    // 頂点 1, 2 のインデックスはそれぞれ 0, 2
    graph.add_edge(0, 2);
    println!("\n辺 1-2 を追加した後のグラフ");
    graph.print();

    /* 辺を削除する */
    // 頂点 1, 3 のインデックスはそれぞれ 0, 1
    graph.remove_edge(0, 1);
    println!("\n辺 1-3 を削除した後のグラフ");
    graph.print();

    /* 頂点を追加する */
    graph.add_vertex(6);
    println!("\n頂点 6 を追加した後のグラフ");
    graph.print();

    /* 頂点を削除する */
    // 頂点 3 のインデックスは 1
    graph.remove_vertex(1);
    println!("\n頂点 3 を削除した後のグラフ");
    graph.print();
}
