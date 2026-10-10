/*
 * File: graph_adjacency_list.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

pub use hello_algo_rust::include::{vals_to_vets, vets_to_vals, Vertex};

use std::collections::HashMap;

/* Тип неориентированного графа на основе списка смежности */
pub struct GraphAdjList {
    // Список смежности, где key — вершина, а value — все смежные ей вершины
    pub adj_list: HashMap<Vertex, Vec<Vertex>>, // maybe HashSet<Vertex> for value part is better?
}

impl GraphAdjList {
    /* Конструктор */
    pub fn new(edges: Vec<[Vertex; 2]>) -> Self {
        let mut graph = GraphAdjList {
            adj_list: HashMap::new(),
        };
        // Добавить все вершины и ребра
        for edge in edges {
            graph.add_vertex(edge[0]);
            graph.add_vertex(edge[1]);
            graph.add_edge(edge[0], edge[1]);
        }

        graph
    }

    /* Получить число вершин */
    #[allow(unused)]
    pub fn size(&self) -> usize {
        self.adj_list.len()
    }

    /* Добавление ребра */
    pub fn add_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if vet1 == vet2 {
            panic!("value error");
        }
        // Добавить ребро vet1 - vet2
        self.adj_list.entry(vet1).or_default().push(vet2);
        self.adj_list.entry(vet2).or_default().push(vet1);
    }

    /* Удаление ребра */
    #[allow(unused)]
    pub fn remove_edge(&mut self, vet1: Vertex, vet2: Vertex) {
        if vet1 == vet2 {
            panic!("value error");
        }
        // Удалить ребро vet1 - vet2
        self.adj_list
            .entry(vet1)
            .and_modify(|v| v.retain(|&e| e != vet2));
        self.adj_list
            .entry(vet2)
            .and_modify(|v| v.retain(|&e| e != vet1));
    }

    /* Добавление вершины */
    pub fn add_vertex(&mut self, vet: Vertex) {
        if self.adj_list.contains_key(&vet) {
            return;
        }
        // Добавить новый список в список смежности
        self.adj_list.insert(vet, vec![]);
    }

    /* Удаление вершины */
    #[allow(unused)]
    pub fn remove_vertex(&mut self, vet: Vertex) {
        // Удалить из списка смежности список, соответствующий вершине vet
        self.adj_list.remove(&vet);
        // Обойти списки других вершин и удалить все ребра, содержащие vet
        for list in self.adj_list.values_mut() {
            list.retain(|&v| v != vet);
        }
    }

    /* Вывести список смежности */
    pub fn print(&self) {
        println!("Список смежности =");
        for (vertex, list) in &self.adj_list {
            let list = list.iter().map(|vertex| vertex.val).collect::<Vec<i32>>();
            println!("{}: {:?},", vertex.val, list);
        }
    }
}

/* Driver Code */
#[allow(unused)]
fn main() {
    /* Инициализация неориентированного графа */
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
    println!("\nГраф после инициализации");
    graph.print();

    /* Добавление ребра */
    // Вершины 1 и 2 соответствуют v[0] и v[2]
    graph.add_edge(v[0], v[2]);
    println!("\nГраф после добавления ребра 1-2");
    graph.print();

    /* Удаление ребра */
    // Вершины 1 и 3 соответствуют v[0] и v[1]
    graph.remove_edge(v[0], v[1]);
    println!("\nГраф после удаления ребра 1-3");
    graph.print();

    /* Добавление вершины */
    let v5 = Vertex { val: 6 };
    graph.add_vertex(v5);
    println!("\nГраф после добавления вершины 6");
    graph.print();

    /* Удаление вершины */
    // Вершина 3 соответствует v[1]
    graph.remove_vertex(v[1]);
    println!("\nГраф после удаления вершины 3");
    graph.print();
}
