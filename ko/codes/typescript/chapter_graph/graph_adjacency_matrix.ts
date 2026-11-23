/**
 * File: graph_adjacency_matrix.ts
 * Created Time: 2023-02-09
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 인접 행렬로 구현한 무방향 그래프 클래스 */
class GraphAdjMat {
    vertices: number[]; // 정점 리스트의 원소는 정점 값을, 인덱스는 정점 인덱스를 나타낸다
    adjMat: number[][]; // 인접 행렬의 행과 열 인덱스는 정점 인덱스에 해당한다

    /* 생성자 */
    constructor(vertices: number[], edges: number[][]) {
        this.vertices = [];
        this.adjMat = [];
        // 정점 추가
        for (const val of vertices) {
            this.addVertex(val);
        }
        // 간선 추가
        // edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
        for (const e of edges) {
            this.addEdge(e[0], e[1]);
        }
    }

    /* 정점 개수 반환 */
    size(): number {
        return this.vertices.length;
    }

    /* 정점 추가 */
    addVertex(val: number): void {
        const n: number = this.size();
        // 정점 리스트에 새 정점의 값을 추가한다
        this.vertices.push(val);
        // 인접 행렬에 행 하나를 추가한다
        const newRow: number[] = [];
        for (let j: number = 0; j < n; j++) {
            newRow.push(0);
        }
        this.adjMat.push(newRow);
        // 인접 행렬에 열 하나를 추가한다
        for (const row of this.adjMat) {
            row.push(0);
        }
    }

    /* 정점 삭제 */
    removeVertex(index: number): void {
        if (index >= this.size()) {
            throw new RangeError('인덱스가 범위를 벗어났다');
        }
        // 정점 리스트에서 인덱스 index의 정점을 제거한다
        this.vertices.splice(index, 1);

        // 인접 행렬에서 인덱스 index의 행을 삭제한다
        this.adjMat.splice(index, 1);
        // 인접 행렬에서 인덱스 index의 열을 삭제한다
        for (const row of this.adjMat) {
            row.splice(index, 1);
        }
    }

    /* 간선 추가 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    addEdge(i: number, j: number): void {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('인덱스가 범위를 벗어났다');
        }
        // 무방향 그래프의 인접 행렬은 주대각선을 기준으로 대칭이므로 (i, j) === (j, i)를 만족한다
        this.adjMat[i][j] = 1;
        this.adjMat[j][i] = 1;
    }

    /* 간선 삭제 */
    // 매개변수 i, j는 vertices 원소의 인덱스에 해당한다
    removeEdge(i: number, j: number): void {
        // 인덱스가 범위를 벗어나거나 서로 같은 경우를 처리한다
        if (i < 0 || j < 0 || i >= this.size() || j >= this.size() || i === j) {
            throw new RangeError('인덱스가 범위를 벗어났다');
        }
        this.adjMat[i][j] = 0;
        this.adjMat[j][i] = 0;
    }

    /* 인접 행렬 출력 */
    print(): void {
        console.log('정점 리스트 = ', this.vertices);
        console.log('인접 행렬 =', this.adjMat);
    }
}

/* 실행 코드 */
/* 무방향 그래프 초기화 */
// edges의 원소는 정점 인덱스, 즉 vertices 원소의 인덱스를 나타낸다
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
console.log('\n초기화한 후의 그래프');
graph.print();

/* 간선 추가 */
// 정점 1, 2의 인덱스는 각각 0, 2이다
graph.addEdge(0, 2);
console.log('\n간선 1-2를 추가한 후의 그래프');
graph.print();

/* 간선 삭제 */
// 정점 1, 3의 인덱스는 각각 0, 1이다
graph.removeEdge(0, 1);
console.log('\n간선 1-3을 삭제한 후의 그래프');
graph.print();

/* 정점 추가 */
graph.addVertex(6);
console.log('\n정점 6을 추가한 후의 그래프');
graph.print();

/* 정점 삭제 */
// 정점 3의 인덱스는 1이다
graph.removeVertex(1);
console.log('\n정점 3을 삭제한 후의 그래프');
graph.print();

export {};
