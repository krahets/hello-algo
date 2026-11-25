/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* Тип неориентированного графа на матрице смежности */
pub struct GraphAdjMat {
    // Список вершин: элементы — значения вершин, позиции — их индексы
    pub vertices: Vec<i32>,
    // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин
    pub adj_mat: Vec<Vec<i32>>,
}

impl GraphAdjMat {
    /* Конструктор */
    pub fn new(vertices: Vec<i32>, edges: Vec<[usize; 2]>) -> Self {
        let mut graph = GraphAdjMat {
            vertices: vec![],
            adj_mat: vec![],
        };
        // Добавить вершину
        for val in vertices {
            graph.add_vertex(val);
        }
        // Добавить ребро
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* Получить число вершин */
    pub fn size(&self) -> usize {
        self.vertices.len()
    }

    /* Добавить вершину */
    pub fn add_vertex(&mut self, val: i32) {
        let n = self.size();
        // Добавить значение новой вершины в список вершин
        self.vertices.push(val);
        // Добавить строку в матрицу смежности
        self.adj_mat.push(vec![0; n]);
        // Добавить столбец в матрицу смежности
        for row in self.adj_mat.iter_mut() {
            row.push(0);
        }
    }

    /* Удалить вершину */
    pub fn remove_vertex(&mut self, index: usize) {
        if index >= self.size() {
            panic!("index error")
        }
        // Удалить из списка вершин вершину с индексом index
        self.vertices.remove(index);
        // Удалить из матрицы смежности строку с индексом index
        self.adj_mat.remove(index);
        // Удалить из матрицы смежности столбец с индексом index
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* Добавить ребро */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // Параметры i и j — индексы элементов vertices
        // Проверить выход индексов за границы и их совпадение
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* Удалить ребро */
    // Параметры i и j — индексы элементов vertices
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // Параметры i и j — индексы элементов vertices
        // Проверить выход индексов за границы и их совпадение
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        self.adj_mat[i][j] = 0;
        self.adj_mat[j][i] = 0;
    }

    /* Вывести матрицу смежности */
    pub fn print(&self) {
        println!("Список вершин = {:?}", self.vertices);
        println!("Матрица смежности =");
        println!("[");
        for row in &self.adj_mat {
            println!("  {:?},", row);
        }
        println!("]")
    }
}

/* Пример использования */
fn main() {
    /* Инициализировать неориентированный граф */
    // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\nГраф после инициализации:");
    graph.print();

    /* Добавить ребро */
    // Индексы вершин 1 и 2 равны 0 и 2 соответственно
    graph.add_edge(0, 2);
    println!("\nГраф после добавления ребра 1–2:");
    graph.print();

    /* Удалить ребро */
    // Индексы вершин 1 и 3 равны 0 и 1 соответственно
    graph.remove_edge(0, 1);
    println!("\nГраф после удаления ребра 1–3:");
    graph.print();

    /* Добавить вершину */
    graph.add_vertex(6);
    println!("\nГраф после добавления вершины 6:");
    graph.print();

    /* Удалить вершину */
    // Индекс вершины 3 равен 1
    graph.remove_vertex(1);
    println!("\nГраф после удаления вершины 3:");
    graph.print();
}
