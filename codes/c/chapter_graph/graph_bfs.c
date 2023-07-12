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
void queuePush(queue *q, Vertex *v) {
    q->list[q->tail] = v;
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
void graphBFS(graphAdjList *t) {
    // 初始化队列与哈希表
    queue *que = newQueue(t->size);
    hashTable *visited = newHash(t->size);
    // 将第一个元素入队
    queuePush(que, t->verticesList[0]);
    hashMark(visited, t->verticesList[0]->pos);

    printf("\n[");
    while (que->head < que->tail) {
        // 遍历该顶点的边链表，将所有与该顶点有连接的，并且未被标记的顶点入队
        Node *n = queueTop(que)->linked->head->next;
        while (n != 0) {
            // 查询哈希表，若该索引的顶点已入队，则跳过，否则入队并标记
            if (hashQuery(visited, n->val->pos) != 0) {
                queuePush(que, n->val);
                hashMark(visited, n->val->pos);
            }
            n = n->next;
        }
        // 打印队首元素
        if (que->head == que->tail - 1) {
            printf("%d]\n", queueTop(que)->val);
        } else {
            printf("%d, ", queueTop(que)->val);
        }
        // 队首元素出队
        queuePop(que);
    }
    printf("\n");

    // 释放队列与哈希表内存
    freeQueue(que);
    freeHash(visited);
}

int main() {

    /* 初始化无向图 */
    graphAdjList *graph = newGraphic(3);
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
    
    printf("\n广度优先遍历（BFS）顶点序列为");
    graphBFS(graph);

    return 0;
}
