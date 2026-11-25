/**
 * File: graph_adjacency_matrix.js
 * Created Time: 2023-02-09
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 隣接行列で無向グラフを表すクラス */
class GraphAdjMat {
    vertices; // 頂点リスト。要素は頂点の値を、インデックスは頂点のインデックスを表す
    adjMat; // 隣接行列。行と列のインデックスは頂点のインデックスに対応する

    /* コンストラクタ */
    constructor(vertices, edges) {
        this.vertices = [];
        this.adjMat = [];
        // 頂点を追加する
        for (const val of vertices) {
            this.addVertex(val);
        }
        // 辺を追加する
        // edges の各要素が示すのは頂点のインデックス、すなわち vertices の要素のインデックス
        for (const e of edges) {
            this.addEdge(e[0], e[1]);
        }
    }

    /* 頂点数を取得する */
    size() {
        return this.vertices.length;
    }

    /* 頂点を追加する */
    addVertex(val) {
        const n = this.size();
        // 新しい頂点の値を頂点リストに追加する
        this.vertices.push(val);
        // 隣接行列に行を 1 つ追加する
        const newRow = [];
        for (let j = 0; j < n; j++) {
            newRow.push(0);
        }
        this.adjMat.push(newRow);
        // 隣接行列に列を 1 つ追加する
        for (const row of this.adjMat) {
            row.push(0);
        }
    }

    /* 頂点を削除する */
    removeVertex(index) {
        if (index >= this.size()) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // 頂点リストからインデックス index の頂点を削除する
        this.vertices.splice(index, 1);

        // 隣接行列からインデックス index の行を削除する
        this.adjMat.splice(index, 1);
        // 隣接行列からインデックス index の列を削除する
        for (const row of this.adjMat) {
            row.splice(index, 1);
        }
    }

    /* 辺を追加する */
    // 引数 i と j は vertices の要素のインデックス
    addEdge(i, j) {
        // インデックスが範囲外または同じ値の場合の処理
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // 無向グラフの隣接行列は主対角線に関して対称で、(i, j) === (j, i) を満たす
        this.adjMat[i][j] = 1;
        this.adjMat[j][i] = 1;
    }

    /* 辺を削除する */
    // 引数 i と j は vertices の要素のインデックス
    removeEdge(i, j) {
        // インデックスが範囲外または同じ値の場合の処理
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        this.adjMat[i][j] = 0;
        this.adjMat[j][i] = 0;
    }

    /* 隣接行列を表示する */
    print() {
        console.log('頂点リスト = ', this.vertices);
        console.log('隣接行列 =', this.adjMat);
    }
}

/* 実行例 */
/* 無向グラフを初期化する */
// edges の各要素が示すのは頂点のインデックス、すなわち vertices の要素のインデックス
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
console.log('\n初期化後のグラフ：');
graph.print();

/* 辺を追加する */
// 頂点 1 と 2 のインデックスはそれぞれ 0 と 2
graph.addEdge(0, 2);
console.log('\n辺 1-2 を追加した後のグラフ：');
graph.print();

/* 辺を削除する */
// 頂点 1 と 3 のインデックスはそれぞれ 0 と 1
graph.removeEdge(0, 1);
console.log('\n辺 1-3 を削除した後のグラフ：');
graph.print();

/* 頂点を追加する */
graph.addVertex(6);
console.log('\n頂点 6 を追加した後のグラフ：');
graph.print();

/* 頂点を削除する */
// 頂点 3 のインデックスは 1
graph.removeVertex(1);
console.log('\n頂点 3 を削除した後のグラフ：');
graph.print();
