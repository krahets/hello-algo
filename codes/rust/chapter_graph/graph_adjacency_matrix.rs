/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* 基于邻接矩阵实现的无向图类型 */
pub struct GraphAdjMat {
    // 顶点列表，元素代表“顶点值”，索引代表“顶点索引”
    vertices: Vec<i32>,
    // 邻接矩阵，元素值代表两顶点是否相邻，行列索引对应“顶点索引”
    adj_mat: Vec<Vec<bool>>,
}

impl GraphAdjMat {
    /* 构造方法 */
    pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
        let capacity = vertices.len();
        let mut graph = GraphAdjMat {
            vertices: Vec::with_capacity(capacity),
            adj_mat: Vec::with_capacity(capacity),
        };
        // 添加顶点
        for val in vertices {
            graph.add_vertex(val);
        }
        // 添加边
        // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* 获取顶点数量 */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* 添加顶点 */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // 向顶点列表中添加新顶点的值
        self.vertices.push(val);
        // 在邻接矩阵中添加一行
        self.adj_mat.push(vec![false; n]);
        // 在邻接矩阵中添加一列
        for row in self.adj_mat.iter_mut() {
            row.push(false);
        }
    }

    /* 删除顶点 */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("index error")
        }
        // 在顶点列表中移除索引 index 的顶点
        self.vertices.remove(index);
        // 在邻接矩阵中删除索引 index 的行
        self.adj_mat.remove(index);
        // 在邻接矩阵中删除索引 index 的列
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* 添加边 */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // 参数 i, j 对应 vertices 元素索引
        // 索引越界与相等处理
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        // 在无向图中，邻接矩阵关于主对角线对称，即满足 (i, j) == (j, i)
        self.adj_mat[i][j] = true;
        self.adj_mat[j][i] = true;
    }

    /* 删除边 */
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // 参数 i, j 对应 vertices 元素索引
        // 索引越界与相等处理
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        self.adj_mat[i][j] = false;
        self.adj_mat[j][i] = false;
    }

    /* 打印邻接矩阵 */
    pub fn print(&self) {
        println!("顶点列表 = {:?}", self.vertices);
        println!("邻接矩阵 =");
        println!("[");
        for row in &self.adj_mat {
            let mut iter = row.iter();
            let Some(&first) = iter.next() else {
                println!("  [],");
                continue;
            };
            print!("  [{}", first as u8);
            for &element in iter {
                print!(", {}", element as u8);
            }
            println!("],");
        }
        println!("]");
    }
}

/* Driver Code */
fn main() {
    /* 初始化无向图 */
    // 请注意，edges 元素代表顶点索引，即对应 vertices 元素索引
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("初始化后，图为");
    graph.print();

    println!();

    /* 添加边 */
    // 顶点 1, 2 的索引分别为 0, 2
    graph.add_edge(0, 2);
    println!("添加边 1-2 后，图为");
    graph.print();

    println!();

    /* 删除边 */
    // 顶点 1, 3 的索引分别为 0, 1
    graph.remove_edge(0, 1);
    println!("删除边 1-3 后，图为");
    graph.print();

    println!();

    /* 添加顶点 */
    graph.add_vertex(6);
    println!("添加顶点 6 后，图为");
    graph.print();

    println!();

    /* 删除顶点 */
    // 顶点 3 的索引为 1
    graph.remove_vertex(1);
    println!("删除顶点 3 后，图为");
    graph.print();
}
