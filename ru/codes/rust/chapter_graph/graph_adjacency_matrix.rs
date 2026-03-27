/*
 * File: graph_adjacency_matrix.rs
 * Created Time: 2023-07-12
 * Author: night-cruise (2586447362@qq.com)
 */

/* Тип неориентированного графа на основе матрицы смежности */
pub struct GraphAdjMat {
    // Список вершин: элементы представляют «значения вершин», а индексы представляют «индексы вершин»
    pub vertices: Vec<i32>,
    // Матрица смежности, индексы строк и столбцов соответствуют «индексам вершин»
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
        // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
        for edge in edges {
            graph.add_edge(edge[0], edge[1])
        }

        graph
    }

    /* Получить количество вершин */
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
        // Удалить вершину с индексом index из списка вершин
        self.vertices.remove(index);
        // Удалить строку с индексом index из матрицы смежности
        self.adj_mat.remove(index);
        // Удалить столбец с индексом index из матрицы смежности
        for row in self.adj_mat.iter_mut() {
            row.remove(index);
        }
    }

    /* Добавить ребро */
    pub fn add_edge(&mut self, i: usize, j: usize) {
        // Параметры i и j соответствуют индексам элементов vertices
        // Обработка выхода индекса за границы и случая равенства
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        // В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
        self.adj_mat[i][j] = 1;
        self.adj_mat[j][i] = 1;
    }

    /* Удалить ребро */
    // Параметры i и j соответствуют индексам элементов vertices
    pub fn remove_edge(&mut self, i: usize, j: usize) {
        // Параметры i и j соответствуют индексам элементов vertices
        // Обработка выхода индекса за границы и случая равенства
        if i >= self.size() || j >= self.size() || i == j {
            panic!("index error")
        }
        self.adj_mat[i][j] = 0;
        self.adj_mat[j][i] = 0;
    }

    /* Вывести матрицу смежности */
    pub fn print(&self) {
        println!("список вершин = {:?}", self.vertices);
        println!("Матрица смежности =");
        println!("[");
        for row in &self.adj_mat {
            println!("  {:?},", row);
        }
        println!("]")
    }
}

/* Driver Code */
fn main() {
    /* Инициализировать неориентированный граф */
    // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
    let vertices = vec![1, 3, 2, 5, 4];
    let edges = vec![[0, 1], [0, 3], [1, 2], [2, 3], [2, 4], [3, 4]];
    let mut graph = GraphAdjMat::new(vertices, edges);
    println!("\nПосле инициализации граф имеет вид");
    graph.print();

    /* Добавить ребро */
    // Индексы вершин 1 и 2 равны 0 и 2 соответственно
    graph.add_edge(0, 2);
    println!("\nПосле добавления ребра 1-2 граф имеет вид");
    graph.print();

    /* Удалить ребро */
    // Индексы вершин 1 и 3 равны 0 и 1 соответственно
    graph.remove_edge(0, 1);
    println!("\nПосле удаления ребра 1-3 граф имеет вид");
    graph.print();

    /* Добавить вершину */
    graph.add_vertex(6);
    println!("\nПосле добавления вершины 6 граф имеет вид");
    graph.print();

    /* Удалить вершину */
    // Индекс вершины 3 равен 1
    graph.remove_vertex(1);
    println!("\nПосле удаления вершины 3 граф имеет вид");
    graph.print();
}
