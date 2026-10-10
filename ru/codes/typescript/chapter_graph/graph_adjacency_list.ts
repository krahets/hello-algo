/**
 * File: graph_adjacency_list.ts
 * Created Time: 2023-02-09
 * Author: Justin (xiefahit@gmail.com)
 */

import { Vertex } from '../modules/Vertex';

/* Класс неориентированного графа на основе списка смежности */
class GraphAdjList {
    // Список смежности, где key — вершина, а value — все смежные ей вершины
    adjList: Map<Vertex, Vertex[]>;

    /* Конструктор */
    constructor(edges: Vertex[][]) {
        this.adjList = new Map();
        // Добавить все вершины и ребра
        for (const edge of edges) {
            this.addVertex(edge[0]);
            this.addVertex(edge[1]);
            this.addEdge(edge[0], edge[1]);
        }
    }

    /* Получить число вершин */
    size(): number {
        return this.adjList.size;
    }

    /* Добавление ребра */
    addEdge(vet1: Vertex, vet2: Vertex): void {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2
        ) {
            throw new Error('Illegal Argument Exception');
        }
        // Добавить ребро vet1 - vet2
        this.adjList.get(vet1).push(vet2);
        this.adjList.get(vet2).push(vet1);
    }

    /* Удаление ребра */
    removeEdge(vet1: Vertex, vet2: Vertex): void {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2 ||
            this.adjList.get(vet1).indexOf(vet2) === -1
        ) {
            throw new Error('Illegal Argument Exception');
        }
        // Удалить ребро vet1 - vet2
        this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
        this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
    }

    /* Добавление вершины */
    addVertex(vet: Vertex): void {
        if (this.adjList.has(vet)) return;
        // Добавить новый список в список смежности
        this.adjList.set(vet, []);
    }

    /* Удаление вершины */
    removeVertex(vet: Vertex): void {
        if (!this.adjList.has(vet)) {
            throw new Error('Illegal Argument Exception');
        }
        // Удалить из списка смежности список, соответствующий вершине vet
        this.adjList.delete(vet);
        // Обойти списки других вершин и удалить все ребра, содержащие vet
        for (const set of this.adjList.values()) {
            const index: number = set.indexOf(vet);
            if (index > -1) {
                set.splice(index, 1);
            }
        }
    }

    /* Вывести список смежности */
    print(): void {
        console.log('Список смежности =');
        for (const [key, value] of this.adjList.entries()) {
            const tmp = [];
            for (const vertex of value) {
                tmp.push(vertex.val);
            }
            console.log(key.val + ': ' + tmp.join());
        }
    }
}

/* Driver Code */
if (import.meta.url.endsWith(process.argv[1])) {
    /* Инициализация неориентированного графа */
    const v0 = new Vertex(1),
        v1 = new Vertex(3),
        v2 = new Vertex(2),
        v3 = new Vertex(5),
        v4 = new Vertex(4);
    const edges = [
        [v0, v1],
        [v1, v2],
        [v2, v3],
        [v0, v3],
        [v2, v4],
        [v3, v4],
    ];
    const graph = new GraphAdjList(edges);
    console.log('\nПосле инициализации граф имеет вид');
    graph.print();

    /* Добавление ребра */
    // Вершины 1 и 2 соответствуют v0 и v2
    graph.addEdge(v0, v2);
    console.log('\nПосле добавления ребра 1-2 граф имеет вид');
    graph.print();

    /* Удаление ребра */
    // Вершины 1 и 3 соответствуют v0 и v1
    graph.removeEdge(v0, v1);
    console.log('\nПосле удаления ребра 1-3 граф имеет вид');
    graph.print();

    /* Добавление вершины */
    const v5 = new Vertex(6);
    graph.addVertex(v5);
    console.log('\nПосле добавления вершины 6 граф имеет вид');
    graph.print();

    /* Удаление вершины */
    // Вершина 3 соответствует v1
    graph.removeVertex(v1);
    console.log('\nПосле удаления вершины 3 граф имеет вид');
    graph.print();
}

export { GraphAdjList };
