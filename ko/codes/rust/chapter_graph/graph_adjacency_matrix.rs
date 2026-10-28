/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* 인접 행렬로 구현한 무방향 그래프 자료형 */
pub struct GraphAdjMat {
    // 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
    pub vertices: Vec<i32>,
    // 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다
    pub adj_mat: Vec<Vec<i32>>,
}

impl GraphAdjMat {
    /* 생성자 */
    pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
        let mut graph = GraphAdjMat {
            vertices: vec![],
            adj_mat: vec![],
        };
        // 정점 추가
        for val in vertices {
            graph.add_vertex(val);
        }
        // 간선 추가
        // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* 정점 개수 반환 */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* 정점 추가 */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // 정점 리스트에 새 정점의 값을 추가한다
        self.vertices.push(val);
        // 인접 행렬에 행 하나를 추가한다
        self.adj_mat.push(vec![0; n]);
        // 인접 행렬에 열 하나를 추가한다
        for row in self.adj_mat.iter_mut() {
            row.push(0);
        }
    }

    /* 정점 삭제 */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("인덱스 오류")
        }
        // 정점 리스트에서 인덱스 index의 정점을 제거한다
        self.vertices.remove(index);
        // 인접 행렬에서 인덱스 index의 행을 삭제한다
        self.adj_mat.remove(index);
        // 인접 행렬에서 인덱스 index의 열을 삭제한다
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* 간선 추가 */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if i >= self.size() || j >= self.size() || i == j {
            panic!("인덱스 오류")
        }
        // 무방향 그래프의 인접 행렬은 주대각선에 대해 대칭이며, (i, j) == (j, i)를 만족한다
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* 간선 삭제 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if i >= self.size() || j >= self.size() || i == j {
            panic!("인덱스 오류")
        }
        self.adj_mat[i][j] = 0;
        self.adj_mat[j][i] = 0;
    }

    /* 인접 행렬 출력 */
    pub fn print(&self) {
        println!("정점 리스트 = {:?}", self.vertices);
        println!("인접 행렬 =");
        println!("[");
        for row in &self.adj_mat {
            println!("  {:?},", row);
        }
        println!("]")
    }
}

/* 실행 코드 */
fn main() {
    /* 무방향 그래프 초기화 */
    // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\n초기화한 후의 그래프");
    graph.print();

    /* 간선 추가 */
    // 정점 1, 2의 인덱스는 각각 0, 2이다
    graph.add_edge(0, 2);
    println!("\n간선 1-2를 추가한 후의 그래프");
    graph.print();

    /* 간선 삭제 */
    // 정점 1, 3의 인덱스는 각각 0, 1이다
    graph.remove_edge(0, 1);
    println!("\n간선 1-3을 삭제한 후의 그래프");
    graph.print();

    /* 정점 추가 */
    graph.add_vertex(6);
    println!("\n정점 6을 추가한 후의 그래프");
    graph.print();

    /* 정점 삭제 */
    // 정점 3의 인덱스는 1이다
    graph.remove_vertex(1);
    println!("\n정점 3을 삭제한 후의 그래프");
    graph.print();
}
