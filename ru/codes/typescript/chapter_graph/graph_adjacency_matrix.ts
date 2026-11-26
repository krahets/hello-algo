/**
 * File: graph_adjacency_matrix.ts
 * Created Time: 2023-02-09
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Неориентированный граф на матрице смежности */
class GraphAdjMat {
    vertices: number[]; // Список вершин: элементы — значения вершин, позиции — их индексы
    adjMat: number[][]; // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

    /* Конструктор */
    constructor(vertices: number[], edges: number[][]) {
        this.vertices = [];
        this.adjMat = [];
        // Добавить вершину
        for (const val of vertices) {
            this.addVertex(val);
        }
        // Добавить ребро
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        for (const e of edges) {
            this.addEdge(e[0], e[1]);
        }
    }

    /* Получить число вершин */
    size(): number {
        return this.vertices.length;
    }

    /* Добавить вершину */
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

    /* Удалить вершину */
    removeVertex(index: number): void {
        if (index >= this.size()) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // Удалить из списка вершин вершину с индексом index
        this.vertices.splice(index, 1);

        // Удалить из матрицы смежности строку с индексом index
        this.adjMat.splice(index, 1);
        // Удалить из матрицы смежности столбец с индексом index
        for (const row of this.adjMat) {
            row.splice(index, 1);
        }
    }

    /* Добавить ребро */
    // Параметры i и j — индексы элементов vertices
    addEdge(i: number, j: number): void {
        // Проверить выход индексов за границы и их совпадение
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) === (j, i)
        this.adjMat[i][j] = 1;
        this.adjMat[j][i] = 1;
    }

    /* Удалить ребро */
    // Параметры i и j — индексы элементов vertices
    removeEdge(i: number, j: number): void {
        // Проверить выход индексов за границы и их совпадение
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

/* Пример использования */
/* Инициализировать неориентированный граф */
// Элементы edges содержат индексы вершин, то есть индексы элементов vertices
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
console.log('\nГраф после инициализации:');
graph.print();

/* Добавить ребро */
// Индексы вершин 1 и 2 равны 0 и 2 соответственно
graph.addEdge(0, 2);
console.log('\nГраф после добавления ребра 1–2:');
graph.print();

/* Удалить ребро */
// Индексы вершин 1 и 3 равны 0 и 1 соответственно
graph.removeEdge(0, 1);
console.log('\nГраф после удаления ребра 1–3:');
graph.print();

/* Добавить вершину */
graph.addVertex(6);
console.log('\nГраф после добавления вершины 6:');
graph.print();

/* Удалить вершину */
// Индекс вершины 3 равен 1
graph.removeVertex(1);
console.log('\nГраф после удаления вершины 3:');
graph.print();

export {};
