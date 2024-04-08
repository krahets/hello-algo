/**
 * File: graph_adjacency_list.js
 * Created Time: 2023-02-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { Vertex } = require('../modules/Vertex');

/* 基於鄰接表實現的無向圖類別 */
class GraphAdjList {
    // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
    adjList;

    /* 建構子 */
    constructor(edges) {
        this.adjList = new Map();
        // 新增所有頂點和邊
        for (const edge of edges) {
            this.addVertex(edge[0]);
            this.addVertex(edge[1]);
            this.addEdge(edge[0], edge[1]);
        }
    }

    /* 獲取頂點數量 */
    size() {
        return this.adjList.size;
    }

    /* 新增邊 */
    addEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2
        ) {
            throw new Error('Illegal Argument Exception');
        }
        // 新增邊 vet1 - vet2
        this.adjList.get(vet1).push(vet2);
        this.adjList.get(vet2).push(vet1);
    }

    /* 刪除邊 */
    removeEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2
        ) {
            throw new Error('Illegal Argument Exception');
        }
        // 刪除邊 vet1 - vet2
        this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
        this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
    }

    /* 新增頂點 */
    addVertex(vet) {
        if (this.adjList.has(vet)) return;
        // 在鄰接表中新增一個新鏈結串列
        this.adjList.set(vet, []);
    }

    /* 刪除頂點 */
    removeVertex(vet) {
        if (!this.adjList.has(vet)) {
            throw new Error('Illegal Argument Exception');
        }
        // 在鄰接表中刪除頂點 vet 對應的鏈結串列
        this.adjList.delete(vet);
        // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
        for (const set of this.adjList.values()) {
            const index = set.indexOf(vet);
            if (index > -1) {
                set.splice(index, 1);
            }
        }
    }

    /* 列印鄰接表 */
    print() {
        console.log('鄰接表 =');
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
    /* 初始化無向圖 */
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
    console.log('\n初始化後，圖為');
    graph.print();

    /* 新增邊 */
    // 頂點 1, 2 即 v0, v2
    graph.addEdge(v0, v2);
    console.log('\n新增邊 1-2 後，圖為');
    graph.print();

    /* 刪除邊 */
    // 頂點 1, 3 即 v0, v1
    graph.removeEdge(v0, v1);
    console.log('\n刪除邊 1-3 後，圖為');
    graph.print();

    /* 新增頂點 */
    const v5 = new Vertex(6);
    graph.addVertex(v5);
    console.log('\n新增頂點 6 後，圖為');
    graph.print();

    /* 刪除頂點 */
    // 頂點 3 即 v1
    graph.removeVertex(v1);
    console.log('\n刪除頂點 3 後，圖為');
    graph.print();
}

module.exports = {
    GraphAdjList,
};
