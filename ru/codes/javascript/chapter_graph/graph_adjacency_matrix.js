/**
 * File: graph_adjacency_matrix.js
 * Created Time: 2023-02-09
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Класс неориентированного графа на основе матрицы смежности */
class GraphAdjMat {
    vertices; // Список вершин: элементы представляют «значения вершин», а индексы представляют «индексы вершин»
    adjMat; // Матрица смежности, индексы строк и столбцов соответствуют «индексам вершин»

    /* Конструктор */
    constructor(vertices, edges) {
        this.vertices = [];
        this.adjMat = [];
        // Добавить вершину
        for (const val of vertices) {
            this.addVertex(val);
        }
        // Добавить ребро
        // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
        for (const e of edges) {
            this.addEdge(e[0], e[1]);
        }
    }

    /* Получить количество вершин */
    size() {
        return this.vertices.length;
    }

    /* Добавить вершину */
    addVertex(val) {
        const n = this.size();
        // Добавить значение новой вершины в список вершин
        this.vertices.push(val);
        // Добавить строку в матрицу смежности
        const newRow = [];
        for (let j = 0; j < n; j++) {
            newRow.push(0);
        }
        this.adjMat.push(newRow);
        // Добавить столбец в матрицу смежности
        for (const row of this.adjMat) {
            row.push(0);
        }
    }

    /* Удалить вершину */
    removeVertex(index) {
        if (index >= this.size()) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // Удалить вершину с индексом index из списка вершин
        this.vertices.splice(index, 1);

        // Удалить строку с индексом index из матрицы смежности
        this.adjMat.splice(index, 1);
        // Удалить столбец с индексом index из матрицы смежности
        for (const row of this.adjMat) {
            row.splice(index, 1);
        }
    }

    /* Добавить ребро */
    // Параметры i и j соответствуют индексам элементов vertices
    addEdge(i, j) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) === (j, i)
        this.adjMat[i][j] = 1;
        this.adjMat[j][i] = 1;
    }

    /* Удалить ребро */
    // Параметры i и j соответствуют индексам элементов vertices
    removeEdge(i, j) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        this.adjMat[i][j] = 0;
        this.adjMat[j][i] = 0;
    }

    /* Вывести матрицу смежности */
    print() {
        console.log('список вершин =', this.vertices);
        console.log('матрица смежности =', this.adjMat);
    }
}

/* Driver Code */
/* Инициализировать неориентированный граф */
// Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
const vertices = [1, 3, 2, 5, 4];
const edges = [
    [0, 1],
    [1, 2],
    [2, 3],
    [0, 3],
    [2, 4],
    [3, 4],
];
const graph = new GraphAdjMat(vertices, edges);
console.log('\nПосле инициализации граф имеет вид');
graph.print();

/* Добавить ребро */
// Индексы вершин 1 и 2 равны 0 и 2 соответственно
graph.addEdge(0, 2);
console.log('\nПосле добавления ребра 1-2 граф имеет вид');
graph.print();

/* Удалить ребро */
// Индексы вершин 1 и 3 равны 0 и 1 соответственно
graph.removeEdge(0, 1);
console.log('\nПосле удаления ребра 1-3 граф имеет вид');
graph.print();

/* Добавить вершину */
graph.addVertex(6);
console.log('\nПосле добавления вершины 6 граф имеет вид');
graph.print();

/* Удалить вершину */
// Индекс вершины 3 равен 1
graph.removeVertex(1);
console.log('\nПосле удаления вершины 3 граф имеет вид');
graph.print();
