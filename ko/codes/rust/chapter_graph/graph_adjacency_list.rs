/*
 * File: graph_adjacency_list.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

pub use hello_algo_rust::include::{vals_to_vets, vets_to_vals, Vertex};

use std::collections::HashMap;

/* 인접 리스트로 구현한 무방향 그래프 자료형 */
pub struct GraphAdjList {
    // 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
    pub adj_list: HashMap<Vertex, Vec<Vertex>>, // 값 부분에는 HashSet<Vertex>가 더 적합할까?
}

impl GraphAdjList {
    /* 생성자 */
    pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
        let mut graph = GraphAdjList {
            adj_list: HashMap::new(),
        };
        // 모든 정점과 간선을 추가한다
        for edge in edges {
            graph.add_vertex(edge[0]);
            graph.add_vertex(edge[1]);
            graph.add_edge(edge[0], edge[1]);
        }

        graph
    }

    /* 정점 개수 반환 */
    #[allow(unused)]
    pub fn size(&self) -> usize {
        self.adj_list.len()
    }

    /* 간선 추가 */
    pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if vet1 == vet2 {
            panic!("값 오류");
        }
        // 간선 vet1 - vet2를 추가한다
        self.adj_list.entry(vet1).or_default().push(vet2);
        self.adj_list.entry(vet2).or_default().push(vet1);
    }

    /* 간선 삭제 */
    #[allow(unused)]
    pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if vet1 == vet2 {
            panic!("값 오류");
        }
        // 간선 vet1 - vet2를 삭제한다
        self.adj_list
            .entry(vet1)
            .and_modify(|v| v.retain(|&e| e != vet2));
        self.adj_list
            .entry(vet2)
            .and_modify(|v| v.retain(|&e| e != vet1));
    }

    /* 정점 추가 */
    pub fn add_vertex(&mut self, vet: Vertex) {
        if self.adj_list.contains_key(&vet) {
            return;
        }
        // 인접 리스트에 새 연결 리스트를 추가한다
        self.adj_list.insert(vet, vec![]);
    }

    /* 정점 삭제 */
    #[allow(unused)]
    pub fn remove_vertex(&mut self, vet: Vertex) {
        // 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
        self.adj_list.remove(&vet);
        // 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
        for list in self.adj_list.values_mut() {
            list.retain(|&v| v != vet);
        }
    }

    /* 인접 리스트 출력 */
    pub fn print(&self) {
        println!("인접 리스트 =");
        for (vertex, list) in &self.adj_list {
            let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
            println!("{}: {:?},", vertex.val, list);
        }
    }
}

/* 실행 코드 */
#[allow(unused)]
fn main() {
    /* 무방향 그래프 초기화 */
    let v = vals_to_vets(vec![1, 3, 2, 5, 4]);
    let edges = vec![
        [v[0], v[1]],
        [v[0], v[3]],
        [v[1], v[2]],
        [v[2], v[3]],
        [v[2], v[4]],
        [v[3], v[4]],
    ];

    let mut graph = GraphAdjList::new(edges);
    println!("\n초기화한 후의 그래프");
    graph.print();

    /* 간선 추가 */
    // 정점 1, 2는 각각 v[0], v[2]이다
    graph.add_edge(v[0], v[2]);
    println!("\n간선 1-2를 추가한 후의 그래프");
    graph.print();

    /* 간선 삭제 */
    // 정점 1, 3은 각각 v[0], v[1]이다
    graph.remove_edge(v[0], v[1]);
    println!("\n간선 1-3을 삭제한 후의 그래프");
    graph.print();

    /* 정점 추가 */
    let v5 = Vertex { val: 6 };
    graph.add_vertex(v5);
    println!("\n정점 6을 추가한 후의 그래프");
    graph.print();

    /* 정점 삭제 */
    // 정점 3은 v[1]이다
    graph.remove_vertex(v[1]);
    println!("\n정점 3을 삭제한 후의 그래프");
    graph.print();
}
