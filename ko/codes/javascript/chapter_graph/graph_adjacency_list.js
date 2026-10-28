/**
 * File: graph_adjacency_list.js
 * Created Time: 2023-02-09
 * Author: Justin (xiefahit@gmail.com)
 */

const { Vertex } = require('../modules/Vertex');

/* 인접 리스트로 구현한 무방향 그래프 클래스 */
class GraphAdjList {
    // 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
    adjList;

    /* 생성자 */
    constructor(edges) {
        this.adjList = new Map();
        // 모든 정점과 간선을 추가한다
        for (const edge of edges) {
            this.addVertex(edge[0]);
            this.addVertex(edge[1]);
            this.addEdge(edge[0], edge[1]);
        }
    }

    /* 정점 개수 반환 */
    size() {
        return this.adjList.size;
    }

    /* 간선 추가 */
    addEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2
        ) {
            throw new Error('잘못된 인수');
        }
        // 간선 vet1 - vet2를 추가한다
        this.adjList.get(vet1).push(vet2);
        this.adjList.get(vet2).push(vet1);
    }

    /* 간선 삭제 */
    removeEdge(vet1, vet2) {
        if (
            !this.adjList.has(vet1) ||
            !this.adjList.has(vet2) ||
            vet1 === vet2 ||
            this.adjList.get(vet1).indexOf(vet2) === -1
        ) {
            throw new Error('잘못된 인수');
        }
        // 간선 vet1 - vet2를 삭제한다
        this.adjList.get(vet1).splice(this.adjList.get(vet1).indexOf(vet2), 1);
        this.adjList.get(vet2).splice(this.adjList.get(vet2).indexOf(vet1), 1);
    }

    /* 정점 추가 */
    addVertex(vet) {
        if (this.adjList.has(vet)) return;
        // 인접 리스트에 새 연결 리스트를 추가한다
        this.adjList.set(vet, []);
    }

    /* 정점 삭제 */
    removeVertex(vet) {
        if (!this.adjList.has(vet)) {
            throw new Error('잘못된 인수');
        }
        // 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
        this.adjList.delete(vet);
        // 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
        for (const set of this.adjList.values()) {
            const index = set.indexOf(vet);
            if (index > -1) {
                set.splice(index, 1);
            }
        }
    }

    /* 인접 리스트 출력 */
    print() {
        console.log('인접 리스트 =');
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
    /* 실행 코드 */
    /* 무방향 그래프 초기화 */
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
    console.log('\n초기화한 후의 그래프');
    graph.print();

    /* 간선 추가 */
    // 정점 1, 2는 각각 v0, v2이다
    graph.addEdge(v0, v2);
    console.log('\n간선 1-2를 추가한 후의 그래프');
    graph.print();

    /* 간선 삭제 */
    // 정점 1, 3은 각각 v0, v1이다
    graph.removeEdge(v0, v1);
    console.log('\n간선 1-3을 삭제한 후의 그래프');
    graph.print();

    /* 정점 추가 */
    const v5 = new Vertex(6);
    graph.addVertex(v5);
    console.log('\n정점 6을 추가한 후의 그래프');
    graph.print();

    /* 정점 삭제 */
    // 정점 3은 v1이다
    graph.removeVertex(v1);
    console.log('\n정점 3을 삭제한 후의 그래프');
    graph.print();
}

module.exports = {
    GraphAdjList,
};
