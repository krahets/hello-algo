/**
 * File: graph_adjacency_matrix.ts
 * Created Time: 2023-02-09
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Класс неориентированного графа на основе матрицы смежности */
class GraphAdjMat {
    vertices: number[]; // Список вершин: элементы представляют «значения вершин», а индексы — «индексы вершин»
    adjMat: number[][]; // Матрица смежности, где индексы строк и столбцов соответствуют «индексам вершин»

    /* Конструктор */
    constructor(vertices: number[], edges: number[][]) {
        this.vertices = [];
        this.adjMat = [];
        // Добавление вершины
        for (const val of vertices) {
            this.addVertex(val);
        }
        // Добавить ребра
        // Обратите внимание: элементы edges представляют собой индексы вершин, то есть соответствуют индексам элементов vertices
        for (const e of edges) {
            this.addEdge(e[0], e[1]);
        }
    }

    /* Получить число вершин */
    size(): number {
        return this.vertices.length;
    }

    /* Добавление вершины */
    addVertex(val: number): void {
        const n: number = this.size();
        // Добавить значение новой вершины в список вершин
        this.vertices.push(val);
        // Добавить строку в матрицу смежности
        const newRow: number[] = [];
        for (let j: number = 0; j < n; j++) {
            newRow.push(0);
        }
        this.adjMat.push(newRow);
        // Добавить столбец в матрицу смежности
        for (const row of this.adjMat) {
            row.push(0);
        }
    }

    /* Удаление вершины */
    removeVertex(index: number): void {
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

    /* Добавление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    addEdge(i: number, j: number): void {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) === (j, i)
        this.adjMat[i][j] = 1;
        this.adjMat[j][i] = 1;
    }

    /* Удаление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    removeEdge(i: number, j: number): void {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        this.adjMat[i][j] = 0;
        this.adjMat[j][i] = 0;
    }

    /* Вывести матрицу смежности */
    print(): void {
        console.log('Список вершин = ', this.vertices);
        console.log('Матрица смежности =', this.adjMat);
    }
}

/* Driver Code */
/* Инициализация неориентированного графа */
// Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
const vertices: number[] = [1, 3, 2, 5, 4];
const edges: number[][] = [
    [0, 1],
    [1, 2],
    [2, 3],
    [0, 3],
    [2, 4],
    [3, 4],
];
const graph: GraphAdjMat = new GraphAdjMat(vertices, edges);
console.log('\nПосле инициализации граф имеет вид');
graph.print();

/* Добавление ребра */
// Индексы вершин 1 и 2 равны 0 и 2 соответственно
graph.addEdge(0, 2);
console.log('\nПосле добавления ребра 1-2 граф имеет вид');
graph.print();

/* Удаление ребра */
// Индексы вершин 1 и 3 равны 0 и 1 соответственно
graph.removeEdge(0, 1);
console.log('\nПосле удаления ребра 1-3 граф имеет вид');
graph.print();

/* Добавление вершины */
graph.addVertex(6);
console.log('\nПосле добавления вершины 6 граф имеет вид');
graph.print();

/* Удаление вершины */
// Индекс вершины 3 равен 1
graph.removeVertex(1);
console.log('\nПосле удаления вершины 3 граф имеет вид');
graph.print();

export {};
