/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* 인접 행렬로 구현한 무방향 그래프 타입 */
pub struct GraphAdjMat {
    // 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타냄
    pub vertices: Vec<i32>,
    // 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당
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
        // edges의 원소는 정점 인덱스, 즉 vertices의 원소 인덱스를 나타냄
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* 정점 수 구하기 */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* 정점 추가 */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // 정점 리스트에 새 정점의 값 추가
        self.vertices.push(val);
        // 인접 행렬에 행 하나 추가
        self.adj_mat.push(vec![0; n]);
        // 인접 행렬에 열 하나 추가
        for row in self.adj_mat.iter_mut() {
            row.push(0);
        }
    }

    /* 정점 삭제 */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("index error")
        }
        // 정점 리스트에서 인덱스가 index인 정점 삭제
        self.vertices.remove(index);
        // 인접 행렬에서 인덱스가 index인 행 삭제
        self.adj_mat.remove(index);
        // 인접 행렬에서 인덱스가 index인 열 삭제
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* 간선 추가 */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // 매개변수 i, j는 vertices의 원소 인덱스
        // 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        // 무방향 그래프의 인접 행렬은 주대각선을 기준으로 대칭이므로 (i, j) == (j, i)
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* 간선 삭제 */
    // 매개변수 i, j는 vertices의 원소 인덱스
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // 매개변수 i, j는 vertices의 원소 인덱스
        // 인덱스가 범위를 벗어나거나 서로 같은 경우 처리
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
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

/* 실행 예제 */
fn main() {
    /* 무방향 그래프 초기화 */
    // edges의 원소는 정점 인덱스, 즉 vertices의 원소 인덱스를 나타냄
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\n초기화한 그래프:");
    graph.print();

    /* 간선 추가 */
    // 정점 1과 2의 인덱스는 각각 0과 2
    graph.add_edge(0, 2);
    println!("\n간선 1-2를 추가한 그래프:");
    graph.print();

    /* 간선 삭제 */
    // 정점 1과 3의 인덱스는 각각 0과 1
    graph.remove_edge(0, 1);
    println!("\n간선 1-3을 삭제한 그래프:");
    graph.print();

    /* 정점 추가 */
    graph.add_vertex(6);
    println!("\n정점 6을 추가한 그래프:");
    graph.print();

    /* 정점 삭제 */
    // 정점 3의 인덱스는 1
    graph.remove_vertex(1);
    println!("\n정점 3을 삭제한 그래프:");
    graph.print();
}
