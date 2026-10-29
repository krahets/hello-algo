/**
 * File: graph_adjacency_list.js
 * Created Time: 2023-02-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { Vertex } = require('../modules/Vertex');

/* 隣接リストで実装した無向グラフクラス */
class GraphAdjList {
    // 隣接リスト。key：頂点、value：その頂点に隣接する全頂点
    adjList;

    /* コンストラクタ */
    constructor(edges) {
        this.adjList = new Map();
        // すべての頂点と辺を追加する
        for (const edge of edges) {
            this.addVertex(edge[0]);
            this.addVertex(edge[1]);
            this.addEdge(edge[0], edge[1]);
        }
    }

    /* 頂点数を取得する */
    size() {
        return this.adjList.size;
    }

    /* 辺を追加する */
    addEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2
        ) {
            throw new Error('不正な引数の例外');
        }
        // 辺 vet1 - vet2 を追加する
        this.adjList.get(vet1).push(vet2);
        this.adjList.get(vet2).push(vet1);
    }

    /* 辺を削除する */
    removeEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2 ||
            this.adjList.get(vet1).indexOf(vet2) === -1
        ) {
            throw new Error('不正な引数の例外');
        }
        // 辺 vet1 - vet2 を削除する
        this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
        this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
    }

    /* 頂点を追加する */
    addVertex(vet) {
        if (this.adjList.has(vet)) return;
        // 隣接リストに新しい連結リストを追加する
        this.adjList.set(vet, []);
    }

    /* 頂点を削除する */
    removeVertex(vet) {
        if (!this.adjList.has(vet)) {
            throw new Error('不正な引数の例外');
        }
        // 隣接リストから頂点 vet に対応する連結リストを削除する
        this.adjList.delete(vet);
        // 他の頂点の連結リストを走査し、vet を含むすべての辺を削除する
        for (const set of this.adjList.values()) {
            const index = set.indexOf(vet);
            if (index > -1) {
                set.splice(index, 1);
            }
        }
    }

    /* 隣接リストを表示する */
    print() {
        console.log('隣接リスト =');
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
    /* 実行用コード */
    /* 無向グラフを初期化する */
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
    console.log('\n初期化後のグラフ');
    graph.print();

    /* 辺を追加する */
    // 頂点 1, 2 は v0, v2 に対応する
    graph.addEdge(v0, v2);
    console.log('\n辺 1-2 を追加した後のグラフ');
    graph.print();

    /* 辺を削除する */
    // 頂点 1, 3 は v0, v1 に対応する
    graph.removeEdge(v0, v1);
    console.log('\n辺 1-3 を削除した後のグラフ');
    graph.print();

    /* 頂点を追加する */
    const v5 = new Vertex(6);
    graph.addVertex(v5);
    console.log('\n頂点 6 を追加した後のグラフ');
    graph.print();

    /* 頂点を削除する */
    // 頂点 3 は v1 に対応する
    graph.removeVertex(v1);
    console.log('\n頂点 3 を削除した後のグラフ');
    graph.print();
}

module.exports = {
    GraphAdjList,
};
