/**
 * File: graph_adjacency_matrix.js
 * Created Time: 2023-02-09
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 隣接行列に基づく無向グラフクラス */
class GraphAdjMat {
    vertices; // 頂点リスト。要素は「頂点値」、インデックスは「頂点インデックス」を表す
    adjMat; // 隣接行列。行・列のインデックスは「頂点インデックス」に対応

    /* コンストラクタ */
    constructor(vertices, edges) {
        this.vertices = [];
        this.adjMat = [];
        // 頂点を追加
        for (const val of vertices) {
            this.addVertex(val);
        }
        // 辺を追加
        // 注意：edges の各要素は頂点インデックスを表し、vertices の要素インデックスに対応する
        for (const e of edges) {
            this.addEdge(e[0], e[1]);
        }
    }

    /* 頂点数を取得 */
    size() {
        return this.vertices.length;
    }

    /* 頂点を追加 */
    addVertex(val) {
        const n = this.size();
        // 頂点リストに新しい頂点の値を追加
        this.vertices.push(val);
        // 隣接行列に 1 行追加
        const newRow = [];
        for (let j = 0; j < n; j++) {
            newRow.push(0);
        }
        this.adjMat.push(newRow);
        // 隣接行列に 1 列追加
        for (const row of this.adjMat) {
            row.push(0);
        }
    }

    /* 頂点を削除 */
    removeVertex(index) {
        if (index >= this.size()) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // 頂点リストから index の頂点を削除する
        this.vertices.splice(index, 1);

        // 隣接行列で index 行を削除する
        this.adjMat.splice(index, 1);
        // 隣接行列で index 列を削除する
        for (const row of this.adjMat) {
            row.splice(index, 1);
        }
    }

    /* 辺を追加 */
    // 引数 i, j は vertices の要素インデックスに対応する
    addEdge(i, j) {
        // インデックスの範囲外と等値の処理
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // 無向グラフでは、隣接行列は主対角線に関して対称であり、(i, j) === (j, i) を満たす
        this.adjMat[i][j] = 1;
        this.adjMat[j][i] = 1;
    }

    /* 辺を削除 */
    // 引数 i, j は vertices の要素インデックスに対応する
    removeEdge(i, j) {
        // インデックスの範囲外と等値の処理
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        this.adjMat[i][j] = 0;
        this.adjMat[j][i] = 0;
    }

    /* 隣接行列を出力 */
    print() {
        console.log('頂点リスト = ', this.vertices);
        console.log('隣接行列 =', this.adjMat);
    }
}

/* Driver Code */
/* 無向グラフを初期化 */
// edges の要素は頂点インデックス、すなわち vertices の要素インデックスに対応する点に注意
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
console.log('\n初期化後のグラフは');
graph.print();

/* 辺を追加 */
// 頂点 1, 2 のインデックスはそれぞれ 0, 2
graph.addEdge(0, 2);
console.log('\n辺 1-2 を追加した後のグラフは');
graph.print();

/* 辺を削除 */
// 頂点 1, 3 のインデックスはそれぞれ 0, 1
graph.removeEdge(0, 1);
console.log('\n辺 1-3 を削除した後のグラフは');
graph.print();

/* 頂点を追加 */
graph.addVertex(6);
console.log('\n頂点 6 を追加した後のグラフは');
graph.print();

/* 頂点を削除 */
// 頂点 3 のインデックスは 1
graph.removeVertex(1);
console.log('\n頂点 3 を削除した後のグラフは');
graph.print();
