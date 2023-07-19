/**
 * File: graph_adjacency_list.c
 * Created Time: 2023-07-07
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

typedef struct Vertex Vertex;
typedef struct Node Node;
typedef struct linkList linkList;

void freeVertex(Vertex *);
void freeLinklist(linkList *);
linkList *newLinklist(Vertex *);

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
    linkList *linked;
    // 索引位，标记该顶点在顶点列表中的索引
    unsigned int pos;
};

/* 顶点节点构造函数 */
Vertex *newVertex(int val) {
    Vertex *vet = (Vertex *)malloc(sizeof(Vertex));
    // 为新节点赋值并建立该节点的链表
    vet->val = val;
    vet->linked = newLinklist(vet);
    return vet;
}

/* 顶点内存释放函数 */
void freeVertex(Vertex *val) {
    // 释放该顶点和该顶点的链表的内存
    freeLinklist(val->linked);
    free(val);
}

/* 链表 */
struct linkList {
    Node *head;
    Node *tail;
};

/* 链表头插法 */
void pushFront(linkList *l, Vertex *val) {
    Node *temp = newNode();
    temp->val = val;
    temp->next = l->head->next;
    l->head->next = temp;
    if (l->tail == l->head) {
        l->tail = temp;
    }
}

/* 链表尾插法 */
void pushBack(linkList *l, Vertex *val) {
    Node *temp = newNode();
    temp->val = val;
    temp->next = 0;
    l->tail->next = temp;
    l->tail = temp;
}

/* 根据顶点地址与该顶点连接的删除边 */
void removeLink(linkList *l, Vertex *val) {
    Node *temp = l->head->next;
    Node *front = l->head;
    while (temp != 0) {
        if (temp->val == val) {
            front->next = temp->next;
            if (l->tail == temp) {
                l->tail = front;
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
void removeNode(linkList *l, Vertex *val) {
    Node *temp = l->head->next;
    Node *front = l->head;
    while (temp != 0) {
        if (temp->val == val) {
            front->next = temp->next;
            if (l->tail == temp) {
                l->tail = front;
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
void freeLinklist(linkList *l) {
    Node *temp = l->head->next;
    while (temp != 0) {
        free(l->head);
        l->head = temp;
        temp = temp->next;
    }
    free(l->head);
    l->head = 0;
    free(l);
}

/* 链表构造函数 */
linkList *newLinklist(Vertex *val) {
    linkList *newLinklist = (linkList *)malloc(sizeof(linkList));

    newLinklist->head = newNode();
    newLinklist->head->val = val;
    newLinklist->tail = newLinklist->head;
    newLinklist->head->next = 0;

    return newLinklist;
}

/* 基于邻接链表实现的无向图类结构 */
struct graphAdjList {
    Vertex **verticesList; // 邻接表
    unsigned int size;     // 顶点数量
    unsigned int capacity; // 顶点容量
};

typedef struct graphAdjList graphAdjList;

/* 添加边 */
void addEdge(graphAdjList *t, int i, int j) {
    // 越界检查
    if (i < 0 || j < 0 || i == j || i >= t->size || j >= t->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }
    // 查找欲添加边的顶点 vet1 - vet2
    Vertex *vet1 = t->verticesList[i];
    Vertex *vet2 = t->verticesList[j];

    // 连接顶点 vet1 - vet2
    pushBack(vet1->linked, vet2);
    pushBack(vet2->linked, vet1);
}

/* 删除边 */
void removeEdge(graphAdjList *t, int i, int j) {
    // 越界检查
    if (i < 0 || j < 0 || i == j || i >= t->size || j >= t->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }

    // 查找欲删除边的顶点 vet1 - vet2
    Vertex *vet1 = t->verticesList[i];
    Vertex *vet2 = t->verticesList[j];

    // 移除待删除边 vet1 - vet2
    removeLink(vet1->linked, vet2);
    removeLink(vet2->linked, vet1);
}

/* 添加顶点 */
void addVertex(graphAdjList *t, int val) {
    // 若大小超过容量，则扩容
    if (t->size >= t->capacity) {
        Vertex **tempList = (Vertex **)malloc(sizeof(Vertex *) * 2 * t->capacity);
        memcpy(tempList, t->verticesList, sizeof(Vertex *) * t->size);
        free(t->verticesList);         // 释放原邻接表内存
        t->verticesList = tempList;    // 指向新邻接表
        t->capacity = t->capacity * 2; // 容量扩大至2倍
    }
    // 申请新顶点内存并将新顶点地址存入顶点列表
    Vertex *newV = newVertex(val);    // 建立新顶点
    newV->pos = t->size;              // 为新顶点标记下标
    newV->linked = newLinklist(newV); // 为新顶点建立链表
    t->verticesList[t->size] = newV;  // 将新顶点加入邻接表
    t->size++;
}

/* 删除顶点 */
void removeVertex(graphAdjList *t, unsigned int index) {
    // 越界检查
    if (index < 0 || index >= t->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }

    Vertex *vet = t->verticesList[index]; // 查找待删节点
    if (vet == 0) {                       // 若不存在该节点，则返回
        printf("index is:%d\n", index);
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }

    // 遍历待删除顶点的链表，将所有与待删除结点有关的边删除
    Node *temp = vet->linked->head->next;
    while (temp != 0) {
        removeLink(temp->val->linked, vet); // 删除与该顶点有关的边
        temp = temp->next;                
    }

    // 将顶点前移
    for (int i = index; i < t->size - 1; i++) {
        t->verticesList[i] = t->verticesList[i + 1]; // 顶点前移
        t->verticesList[i]->pos--;                   // 所有前移的顶点索引值减1
    }
    t->verticesList[t->size - 1] = 0; // 将被删除顶点的位置置 0
    t->size--;

    //释放被删除顶点的内存
    freeVertex(vet);
}

/* 打印顶点与邻接矩阵 */
void printGraph(graphAdjList *t) {
    printf("邻接表  =\n");
    for (int i = 0; i < t->size; i++) {
        Node *n = t->verticesList[i]->linked->head->next;
        printf("%d: [", t->verticesList[i]->val);
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
graphAdjList *newGraphAdjList(unsigned int verticesCapacity) {
    // 申请内存
    graphAdjList *newGraph = (graphAdjList *)malloc(sizeof(graphAdjList));
    // 建立顶点表并分配内存
    newGraph->verticesList = (Vertex **)malloc(sizeof(Vertex *) * verticesCapacity); // 为顶点列表分配内存
    memset(newGraph->verticesList, 0, sizeof(Vertex *) * verticesCapacity);          // 顶点列表置 0
    newGraph->size = 0;                                                              // 初始化顶点数量
    newGraph->capacity = verticesCapacity;                                           // 初始化顶点容量
    // 返回图指针
    return newGraph;                
}
