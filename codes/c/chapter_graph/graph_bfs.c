/**
 * File: graph_bfs.c
 * Created Time: 2023-07-11
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
    // 若顶点已被标记，则返回 1
    if (h->array[index % h->size] == 1) {
        return 1;
    } else {
        return 0;
    }
}

/* 释放哈希表内存 */
void freeHash(hashTable *h) {
    free(h->array);
    free(h);
}

/* 队列 */
struct queue {
    Vertex **list;
    unsigned int size;
    int head;
    int tail;
};

typedef struct queue queue;

/* 初始化队列 */
queue *newQueue(unsigned int size) {
    queue *q = (queue *)malloc(sizeof(queue));
    q->size = size;
    q->list = (Vertex **)malloc(sizeof(Vertex *) * size);
    q->head = 0;
    q->tail = 0;

    return q;
}

/* 入队 */
void queuePush(queue *q, Vertex *vet) {
    q->list[q->tail] = vet;
    q->tail++;
}

/* 出队 */
void queuePop(queue *q) {
    q->head++;
}

/* 队首元素 */
Vertex *queueTop(queue *q) {
    return q->list[q->head];
}

/* 释放队列内存 */
void freeQueue(queue *q) {
    free(q->list);
    free(q);
}

/* 广度优先遍历 */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
Vertex **graphBFS(graphAdjList *t, Vertex *startVet) {
    // 顶点遍历序列
    Vertex **res = (Vertex **)malloc(sizeof(Vertex *) * t->size);
    memset(res, 0, sizeof(Vertex *) * t->size);
    // 队列用于实现 BFS
    queue *que = newQueue(t->size);
    // 哈希表，用于记录已被访问过的顶点
    hashTable *visited = newHash(t->size);
    int resIndex = 0;
    queuePush(que, startVet);         // 将第一个元素入队
    hashMark(visited, startVet->pos); // 标记第一个入队的顶点
    // 以顶点 vet 为起点，循环直至访问完所有顶点
    while (que->head < que->tail) {
        // 遍历该顶点的边链表，将所有与该顶点有连接的，并且未被标记的顶点入队
        Node *n = queueTop(que)->linked->head->next;
        while (n != 0) {
            // 查询哈希表，若该索引的顶点已入队，则跳过，否则入队并标记
            if (hashQuery(visited, n->val->pos) == 1) {
                n = n->next;
                continue; // 跳过已被访问过的顶点
            }
            queuePush(que, n->val);         // 只入队未访问的顶点
            hashMark(visited, n->val->pos); // 标记该顶点已被访问
        }
        // 队首元素存入数组
        res[resIndex] = queueTop(que); // 队首顶点加入顶点遍历序列
        resIndex++;
        queuePop(que); // 队首元素出队
    }
    // 释放内存
    freeQueue(que);
    freeHash(visited);
    resIndex = 0;
    // 返回顶点遍历序列
    return res;
}

/* Driver Code */
int main() {
    /* 初始化无向图 */
    graphAdjList *graph = newGraphAdjList(3);
    // 初始化顶点
    for (int i = 0; i < 10; i++) {
        addVertex(graph, i);
    }
    // 初始化边
    addEdge(graph, 0, 1);
    addEdge(graph, 0, 3);
    addEdge(graph, 1, 2);
    addEdge(graph, 1, 4);
    addEdge(graph, 2, 5);
    addEdge(graph, 3, 4);
    addEdge(graph, 3, 6);
    addEdge(graph, 4, 5);
    addEdge(graph, 4, 7);
    addEdge(graph, 5, 8);
    addEdge(graph, 6, 7);
    addEdge(graph, 7, 8);
    printf("\n初始化后，图为:\n");
    printGraph(graph);
    printf("\n广度优先遍历（BFS）顶点序列为\n");
    Vertex **vets = graphBFS(graph, graph->verticesList[0]);

    // 打印广度优先遍历数组
    printf("[");
    printf("%d", vets[0]->val);
    for (int i = 1; i < graph->size && vets[i] != 0; i++) {
        printf(", %d", vets[i]->val);
    }
    printf("]\n");
    free(vets);

    return 0;
}
