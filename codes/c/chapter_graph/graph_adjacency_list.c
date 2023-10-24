/**
 * File: graph_adjacency_list.c
 * Created Time: 2023-07-07
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

typedef struct Vertex Vertex;
typedef struct Node Node;
typedef struct LinkedList LinkedList;

void freeVertex(Vertex *);
void freeLinklist(LinkedList *);
LinkedList *newLinklist(Vertex *);

/* 链表节点 */
struct Node {
    // 链表节点内包含顶点类和下一个节点地址
    Vertex *val;
    Node *next;
};

/* 链表节点构造函数 */
Node *newNode() {
    Node *n = (Node *)malloc(sizeof(Node));
    n->next = 0;
    n->val = 0;
    return n;
}

/* 顶点节点类 */
struct Vertex {
    // 节点值
    int val;
    // 与其它节点相连接的边的链表
    LinkedList *list;
    // 索引位，标记该顶点在顶点列表中的索引
    unsigned int pos;
};

/* 顶点节点构造函数 */
Vertex *newVertex(int val) {
    Vertex *vet = (Vertex *)malloc(sizeof(Vertex));
    // 为新节点赋值并建立该节点的链表
    vet->val = val;
    vet->list = newLinklist(vet);
    return vet;
}

/* 顶点内存释放函数 */
void freeVertex(Vertex *val) {
    // 释放该顶点和该顶点的链表的内存
    freeLinklist(val->list);
    free(val);
}

/* 链表 */
struct LinkedList {
    Node *head;
    Node *tail;
};

/* 链表头插法 */
void pushFront(LinkedList *list, Vertex *val) {
    Node *temp = newNode();
    temp->val = val;
    temp->next = list->head->next;
    list->head->next = temp;
    if (list->tail == list->head) {
        list->tail = temp;
    }
}

/* 链表尾插法 */
void pushBack(LinkedList *list, Vertex *val) {
    Node *temp = newNode();
    temp->val = val;
    temp->next = 0;
    list->tail->next = temp;
    list->tail = temp;
}

/* 根据顶点地址与该顶点连接的删除边 */
void removeLink(LinkedList *list, Vertex *val) {
    Node *temp = list->head->next;
    Node *front = list->head;
    while (temp != 0) {
        if (temp->val == val) {
            front->next = temp->next;
            if (list->tail == temp) {
                list->tail = front;
            }
            free(temp);
            return;
        }
        front = temp;
        temp = temp->next;
    }
    if (temp->next == 0) {
        printf("vertex not found!\n");
    }
}

/* 根据顶点地址删除顶点 */
void removeItem(LinkedList *list, Vertex *val) {
    Node *temp = list->head->next;
    Node *front = list->head;
    while (temp != 0) {
        if (temp->val == val) {
            front->next = temp->next;
            if (list->tail == temp) {
                list->tail = front;
            }
            freeVertex(val);
            free(temp);
            return;
        }
        front = temp;
        temp = temp->next;
    }
    if (temp->next == 0) {
        printf("vertex not found!\n");
    }
}

/* 释放链表内存 */
void freeLinklist(LinkedList *list) {
    Node *temp = list->head->next;
    while (temp != 0) {
        free(list->head);
        list->head = temp;
        temp = temp->next;
    }
    free(list->head);
    list->head = 0;
    free(list);
}

/* 链表构造函数 */
LinkedList *newLinklist(Vertex *val) {
    LinkedList *newLinklist = (LinkedList *)malloc(sizeof(LinkedList));
    newLinklist->head = newNode();
    newLinklist->head->val = val;
    newLinklist->tail = newLinklist->head;
    newLinklist->head->next = 0;
    return newLinklist;
}

/* 基于邻接链表实现的无向图类结构 */
typedef struct {
    Vertex **vertices;     // 邻接表
    unsigned int size;     // 顶点数量
    unsigned int capacity; // 顶点容量
} GraphAdjList;

/* 添加边 */
void addEdge(GraphAdjList *graph, int i, int j) {
    // 越界检查
    if (i < 0 || j < 0 || i == j || i >= graph->size || j >= graph->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }
    // 查找欲添加边的顶点 vet1 - vet2
    Vertex *vet1 = graph->vertices[i];
    Vertex *vet2 = graph->vertices[j];
    // 连接顶点 vet1 - vet2
    pushBack(vet1->list, vet2);
    pushBack(vet2->list, vet1);
}

/* 删除边 */
void removeEdge(GraphAdjList *graph, int i, int j) {
    // 越界检查
    if (i < 0 || j < 0 || i == j || i >= graph->size || j >= graph->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }
    // 查找欲删除边的顶点 vet1 - vet2
    Vertex *vet1 = graph->vertices[i];
    Vertex *vet2 = graph->vertices[j];
    // 移除待删除边 vet1 - vet2
    removeLink(vet1->list, vet2);
    removeLink(vet2->list, vet1);
}

/* 添加顶点 */
void addVertex(GraphAdjList *graph, int val) {
    // 若大小超过容量，则扩容
    if (graph->size >= graph->capacity) {
        Vertex **tempList = (Vertex **)malloc(sizeof(Vertex *) * 2 * graph->capacity);
        memcpy(tempList, graph->vertices, sizeof(Vertex *) * graph->size);
        free(graph->vertices);                 // 释放原邻接表内存
        graph->vertices = tempList;            // 指向新邻接表
        graph->capacity = graph->capacity * 2; // 容量扩大至2倍
    }
    // 申请新顶点内存并将新顶点地址存入顶点列表
    Vertex *newV = newVertex(val);       // 建立新顶点
    newV->pos = graph->size;             // 为新顶点标记下标
    newV->list = newLinklist(newV);      // 为新顶点建立链表
    graph->vertices[graph->size] = newV; // 将新顶点加入邻接表
    graph->size++;
}

/* 删除顶点 */
void removeVertex(GraphAdjList *graph, unsigned int index) {
    // 越界检查
    if (index < 0 || index >= graph->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }
    Vertex *vet = graph->vertices[index]; // 查找待删节点
    if (vet == 0) {                       // 若不存在该节点，则返回
        printf("index is:%d\n", index);
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }
    // 遍历待删除顶点的链表，将所有与待删除结点有关的边删除
    Node *temp = vet->list->head->next;
    while (temp != 0) {
        removeLink(temp->val->list, vet); // 删除与该顶点有关的边
        temp = temp->next;
    }
    // 将顶点前移
    for (int i = index; i < graph->size - 1; i++) {
        graph->vertices[i] = graph->vertices[i + 1]; // 顶点前移
        graph->vertices[i]->pos--;                   // 所有前移的顶点索引值减 1
    }
    graph->vertices[graph->size - 1] = 0;
    graph->size--;
    // 释放内存
    freeVertex(vet);
}

/* 打印顶点与邻接矩阵 */
void printGraph(GraphAdjList *graph) {
    printf("邻接表  =\n");
    for (int i = 0; i < graph->size; i++) {
        Node *n = graph->vertices[i]->list->head->next;
        printf("%d: [", graph->vertices[i]->val);
        while (n != 0) {
            if (n->next != 0) {
                printf("%d, ", n->val->val);
            } else {
                printf("%d", n->val->val);
            }
            n = n->next;
        }
        printf("]\n");
    }
}

/* 构造函数 */
GraphAdjList *newGraphAdjList(unsigned int verticesCapacity) {
    // 申请内存
    GraphAdjList *newGraph = (GraphAdjList *)malloc(sizeof(GraphAdjList));
    // 建立顶点表并分配内存
    newGraph->vertices = (Vertex **)malloc(sizeof(Vertex *) * verticesCapacity); // 为顶点列表分配内存
    memset(newGraph->vertices, 0, sizeof(Vertex *) * verticesCapacity);          // 顶点列表置 0
    newGraph->size = 0;                                                          // 初始化顶点数量
    newGraph->capacity = verticesCapacity;                                       // 初始化顶点容量
    // 返回图指针
    return newGraph;
}
