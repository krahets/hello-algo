/**
 * File: graph_adjacency_list.ts
 * Created Time: 2023-02-09
 * Author: Justin (xiefahit@gmail.com)
 */

/* 顶点类 */
class Vertex {
    val: number;
    constructor(val: number) {
        this.val = val;
    }
}

/* 基于邻接表实现的无向图类 */
class GraphAdjList {
    // 邻接表，使用哈希表来代替链表，以提升删除边、删除顶点的效率
    // 请注意，adjList 中的元素是 Vertex 对象
    adjList: Map<Vertex, Set<Vertex>>;

    /* 构造方法 */
    constructor(edges: Vertex[][]) {
        this.adjList = new Map();
        // 添加所有顶点和边
        for (const edge of edges) {
            this.addVertex(edge[0]);
            this.addVertex(edge[1]);
            this.addEdge(edge[0], edge[1]);
        }
    }

    /* 获取顶点数量 */
    size(): number {
        return this.adjList.size;
    }

    /* 添加边 */
    addEdge(vet1: Vertex, vet2: Vertex): void {
        if (!this.adjList.has(vet1) || !this.adjList.has(vet2) || vet1 === vet2) {
            throw new Error("Illegal Argument Exception");
        }
        // 添加边 vet1 - vet2
        this.adjList.get(vet1).add(vet2);
        this.adjList.get(vet2).add(vet1);
    }

    /* 删除边 */
    removeEdge(vet1: Vertex, vet2: Vertex): void {
        if (!this.adjList.has(vet1) || !this.adjList.has(vet2) || vet1 === vet2) {
            throw new Error("Illegal Argument Exception");
        }
        // 删除边 vet1 - vet2
        this.adjList.get(vet1).delete(vet2);
        this.adjList.get(vet2).delete(vet1);
    }

    /* 添加顶点 */
    addVertex(vet: Vertex): void {
        if (this.adjList.has(vet)) return;
        // 在邻接表中添加一个新链表
        this.adjList.set(vet, new Set());
    }

    /* 删除顶点 */
    removeVertex(vet: Vertex): void {
        if (!this.adjList.has(vet)) {
            throw new Error("Illegal Argument Exception");
        }
        // 在邻接表中删除顶点 vet 对应的链表
        this.adjList.delete(vet);
        // 遍历其它顶点的链表，删除所有包含 vet 的边
        for (let set of this.adjList.values()) {
            set.delete(vet);
        }
    }

    /* 打印邻接表 */
    print(): void {
        console.log("邻接表 =");
        for (const [key, value] of this.adjList.entries()) {
            const tmp = [];
            for (const vertex of value){
                tmp.push(vertex.val);
            }
            console.log(key.val + ": " + tmp + ",");
        }
    }
}

/* Driver Code */
/* 初始化无向图 */
const v0 = new Vertex(1),
    v1 = new Vertex(3),
    v2 = new Vertex(2),
    v3 = new Vertex(5),
    v4 = new Vertex(4);
const edges = [[v0, v1], [v1, v2], [v2, v3], [v0, v3], [v2, v4], [v3, v4]];
const graph = new GraphAdjList(edges);
console.log("\n初始化后，图为");
graph.print();

/* 添加边 */
// 顶点 1, 2 即 v0, v2
graph.addEdge(v0, v2);
console.log("\n添加边 1-2 后，图为");
graph.print();

/* 删除边 */
// 顶点 1, 3 即 v0, v1
graph.removeEdge(v0, v1);
console.log("\n删除边 1-3 后，图为");
graph.print();

/* 添加顶点 */
const v5 = new Vertex(6);
graph.addVertex(v5);
console.log("\n添加顶点 6 后，图为");
graph.print();

/* 删除顶点 */
// 顶点 3 即 v1
graph.removeVertex(v1);
console.log("\n删除顶点 3 后，图为");
graph.print();

export {}
