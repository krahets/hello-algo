/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

/* 哈希表 */
struct hashTable {
    unsigned int size;
    unsigned int *array;
};

typedef struct hashTable hashTable;

/* 初始化哈希表 */
hashTable *newHash(unsigned int size) {
    hashTable *h = (hashTable *)malloc(sizeof(hashTable));
    h->array = (unsigned int *)malloc(sizeof(unsigned int) * size);
    memset(h->array, 0, sizeof(unsigned int) * size);
    h->size = size;
    return h;
}

/* 标记索引过的顶点 */
void hashMark(hashTable *h, int index) {
    h->array[index % h->size] = 1;
}

/* 查询顶点是否已被标记 */
int hashQuery(hashTable *h, int index) {
    // 若顶点已被标记，则返回 0
    if (h->array[index % h->size] == 1) {
        return 0;
    } else {
        return 1;
    }
}

/* 释放哈希表内存 */
void freeHash(hashTable *h) {
    free(h->array);
    free(h);
}

/* 深度优先遍历递归函数 */
int arrayIndex = 0;
void dfs(Vertex *v, hashTable *visited, Vertex **arrayVertex) {
    if (v == 0) {
        return;
    }
    // 查询哈希表，若该索引的顶点已加入数组，则跳过，否则加入数组并标记
    if (hashQuery(visited, v->pos) != 0) {
        // 标记顶点并将顶点存入数组
        hashMark(visited, v->pos);
        arrayVertex[arrayIndex] = v;
        arrayIndex++;

        // 遍历该顶点链表
        Node *n = v->linked->head->next;

        while (n != 0) {
            // 进入递归
            dfs(n->val, visited, arrayVertex);
            n = n->next;
        }
    }
    return;
}

/* 深度优先遍历 */
Vertex **graphDFS(graphAdjList *t, Vertex *startVet) {
    // 初始化哈希表与遍历结果顶点数组
    Vertex **arrayVertex = (Vertex **)malloc(sizeof(Vertex *) * t->size);
    memset(arrayVertex, 0, sizeof(Vertex *) * t->size);
    hashTable *visited = newHash(t->size);

    // 开始递归遍历
    dfs(startVet, visited, arrayVertex);

    // 释放哈希表内存并将数组索引归零
    freeHash(visited);
    arrayIndex = 0;

    // 返回遍历数组
    return arrayVertex;
}

/* driver code */
int main() {
    /* 初始化无向图 */
    graphAdjList *graph = newGraphic(10);
    addVertex(graph, 6);
    addVertex(graph, 4);
    addVertex(graph, 5);
    addVertex(graph, 2);
    addVertex(graph, 3);
    addVertex(graph, 1);
    addVertex(graph, 0);

    addEdge(graph, 5, 6);
    addEdge(graph, 4, 6);
    addEdge(graph, 3, 5);
    addEdge(graph, 2, 3);
    addEdge(graph, 1, 2);
    addEdge(graph, 0, 2);
    printGraph(graph);

    /* 深度优先遍历 DFS ,从值为0的节点开始，即索引为6 */
    Vertex **v = graphDFS(graph, graph->verticesList[6]);

    /* 输出遍历结果 */
    printf("\n深度优先遍历（DFS）顶点序列为\n");
    printf("[");
    printf("%d", v[0]->val);
    for (int i = 1; i < graph->size && v[i] != 0; i++) {
        printf(", %d", v[i]->val);
    }
    printf("]\n");
    
    // 释放打印的顶点数组内存
    free(v);
    return 0;
}
