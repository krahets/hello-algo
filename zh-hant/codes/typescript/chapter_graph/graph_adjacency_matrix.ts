/**
 * File: graph_adjacency_matrix.ts
 * Created Time: 2023-02-09
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 以鄰接矩陣實作的無向圖類別 */
class GraphAdjMat {
    vertices: number[]; // 頂點清單，元素代表頂點值，索引代表頂點索引
    adjMat: number[][]; // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

    /* 建構函式 */
    constructor(vertices: number[], edges: number[][]) {
        this.vertices = [];
        this.adjMat = [];
        // 新增頂點
        for (const val of vertices) {
            this.addVertex(val);
        }
        // 新增邊
        // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
        for (const e of edges) {
            this.addEdge(e[0], e[1]);
        }
    }

    /* 取得頂點數量 */
    size(): number {
        return this.vertices.length;
    }

    /* 新增頂點 */
    addVertex(val: number): void {
        const n: number = this.size();
        // 將新頂點的值加入頂點清單
        this.vertices.push(val);
        // 在鄰接矩陣中新增一個橫列
        const newRow: number[] = [];
        for (let j: number = 0; j < n; j++) {
            newRow.push(0);
        }
        this.adjMat.push(newRow);
        // 在鄰接矩陣中新增一個直行
        for (const row of this.adjMat) {
            row.push(0);
        }
    }

    /* 刪除頂點 */
    removeVertex(index: number): void {
        if (index >= this.size()) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // 從頂點清單中移除索引為 index 的頂點
        this.vertices.splice(index, 1);

        // 從鄰接矩陣中刪除索引為 index 的橫列
        this.adjMat.splice(index, 1);
        // 從鄰接矩陣中刪除索引為 index 的直行
        for (const row of this.adjMat) {
            row.splice(index, 1);
        }
    }

    /* 新增邊 */
    // 參數 i、j 為 vertices 中的元素索引
    addEdge(i: number, j: number): void {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) === (j, i)
        this.adjMat[i][j] = 1;
        this.adjMat[j][i] = 1;
    }

    /* 刪除邊 */
    // 參數 i、j 為 vertices 中的元素索引
    removeEdge(i: number, j: number): void {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('Index Out Of Bounds Exception');
        }
        this.adjMat[i][j] = 0;
        this.adjMat[j][i] = 0;
    }

    /* 印出鄰接矩陣 */
    print(): void {
        console.log('頂點清單 = ', this.vertices);
        console.log('鄰接矩陣 =', this.adjMat);
    }
}

/* Driver Code */
/* 初始化無向圖 */
// 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
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
console.log('\n初始化後的圖為');
graph.print();

/* 新增邊 */
// 頂點 1、2 的索引分別為 0、2
graph.addEdge(0, 2);
console.log('\n新增邊 1-2 後的圖為');
graph.print();

/* 刪除邊 */
// 頂點 1、3 的索引分別為 0、1
graph.removeEdge(0, 1);
console.log('\n刪除邊 1-3 後的圖為');
graph.print();

/* 新增頂點 */
graph.addVertex(6);
console.log('\n新增頂點 6 後的圖為');
graph.print();

/* 刪除頂點 */
// 頂點 3 的索引為 1
graph.removeVertex(1);
console.log('\n刪除頂點 3 後的圖為');
graph.print();

export {};
