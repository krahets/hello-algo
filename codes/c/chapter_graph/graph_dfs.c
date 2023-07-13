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

/* 栈定义 */
struct stack {
    Vertex **top;
    Vertex **bot;
    unsigned int size;
    unsigned int capacity;
};

typedef struct stack stack;

/* 入栈 */
void staPush(stack *s, Vertex *v) {

    *s->top = v;
    s->top++;
    s->size++;
}

/* 出栈 */
void staPop(stack *s) {
    if (s->size <= 0) {
        printf("stack is empty, pop fail! %s:%d\n", __FILE__, __LINE__);
        return;
    }
    s->top--;
    s->size--;
}

/* 栈顶元素 */
Vertex *staTop(stack *s) {
    if (s->top > s->bot) {
        return *(s->top - 1);
    }

    return 0;
}

/* 释放栈内存 */
void freeStack(stack *s) {
    free(s->bot);
    free(s);
}

/* 初始化栈 */
stack *newStack(unsigned int numberVertices) {
    stack *s = (stack *)malloc(sizeof(stack));
    s->size = 0;
    s->capacity = numberVertices;
    s->bot = (Vertex **)malloc(sizeof(Vertex*) * numberVertices);
    s->top = s->bot;

    return s;
}

/* 深度优先遍历 */
void graphDFS(graphAdjList *t) {
    // 初始化哈希表与栈
    stack *s = newStack(t->size);
    hashTable *visited = newHash(t->size);
    // 第一个元素入栈并打印
    staPush(s, t->verticesList[0]);
    hashMark(visited, t->verticesList[0]->pos);
    printf("\n[%d", staTop(s)->val);

    // 打印深度优先搜索图
    while (s->top > s->bot) {
        // 遍历该顶点的边链表，将所有与该顶点有连接的，并且未被标记的顶点入栈
        Node *n = staTop(s)->linked->head->next;
        // 若顶点链表中含有未被标记的其它顶点，则对他进行标记并打印，然后进入该顶点的链表继续遍历
        while (n != 0) {
            if (hashQuery(visited, n->val->pos) != 0) {
                hashMark(visited, n->val->pos);
                staPush(s, n->val);
                printf(", %d", staTop(s)->val);
                // 若存在未被标记的顶点，则进入该顶点的链表
                n = staTop(s)->linked->head->next;
                continue;
            }
            // 若顶点已被标记，则查看下一个顶点
            n = n->next;
        }
        // 若已经到达最底层，则出栈，继续遍历上层顶点的链表
        staPop(s);
    }
    printf("]\n");

    // 释放栈与哈希表内存
    freeStack(s);
    freeHash(visited);
}

/* driver code */
int main() {
    /* 初始化无向图 */
    graphAdjList *graph = newGraphic(10);
    for (int i = 0; i < 7; i++) {
        addVertex(graph, i);
    }
    addEdge(graph, 0, 1);
    addEdge(graph, 0, 3);
    addEdge(graph, 1, 2);
    addEdge(graph, 2, 5);
    addEdge(graph, 4, 5);
    addEdge(graph, 5, 6);
    printGraph(graph);

    /* 深度优先遍历 DFS */
    printf("\n深度优先遍历（DFS）顶点序列为");
    graphDFS(graph);

    return 0;
}
