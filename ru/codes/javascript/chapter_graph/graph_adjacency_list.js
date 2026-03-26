/**
 * File: graph_adjacency_list.js
 * Created Time: 2023-02-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { Vertex } = require('../modules/Vertex');

/* Класс неориентированного графа на основе списка смежности */
class GraphAdjList {
    // Список смежности, key: вершина, value: все смежные с ней вершины
    adjList;

    /* Конструктор */
    constructor(edges) {
        this.adjList = new Map();
        // Добавить все вершины и ребра
        for (const edge of edges) {
            this.addVertex(edge[0]);
            this.addVertex(edge[1]);
            this.addEdge(edge[0], edge[1]);
        }
    }

    /* Получить количество вершин */
    size() {
        return this.adjList.size;
    }

    /* Добавить ребро */
    addEdge(vet1, vet2) {
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

    /* Удалить ребро */
    removeEdge(vet1, vet2) {
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

    /* Добавить вершину */
    addVertex(vet) {
        if (this.adjList.has(vet)) return;
        // Добавить новый связный список в список смежности
        this.adjList.set(vet, []);
    }

    /* Удалить вершину */
    removeVertex(vet) {
        if (!this.adjList.has(vet)) {
            throw new Error('Illegal Argument Exception');
        }
        // Удалить из списка смежности связный список, соответствующий вершине vet
        this.adjList.delete(vet);
        // Обойти списки других вершин и удалить все ребра, содержащие vet
        for (const set of this.adjList.values()) {
            const index = set.indexOf(vet);
            if (index > -1) {
                set.splice(index, 1);
            }
        }
    }

    /* Вывести список смежности */
    print() {
        console.log('список смежности =');
        for (const [key, value] of this.adjList) {
            const tmp = [];
            for (const vertex of value) {
                tmp.push(vertex.val);
            }
            console.log(key.val + ': ' + tmp.join());
        }
    }
}

if (require.main === module) {
    /* Driver Code */
    /* Инициализировать неориентированный граф */
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

    /* Добавить ребро */
    // вершина 1, 2 то есть v0, v2
    graph.addEdge(v0, v2);
    console.log('\nДобавить ребро 1-2 после, графравно');
    graph.print();

    /* Удалить ребро */
    // вершина 1, 3 то есть v0, v1
    graph.removeEdge(v0, v1);
    console.log('\nУдалить ребро 1-3 после, графравно');
    graph.print();

    /* Добавить вершину */
    const v5 = new Vertex(6);
    graph.addVertex(v5);
    console.log('\nДобавить вершину 6 после, графравно');
    graph.print();

    /* Удалить вершину */
    // вершина 3 то есть v1
    graph.removeVertex(v1);
    console.log('\nУдалить вершину 3 после, графравно');
    graph.print();
}

module.exports = {
    GraphAdjList,
};
