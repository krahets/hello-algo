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
};

/* 顶点节点构造函数 */
Vertex *newVertex(int val) {
    Vertex *v = (Vertex *)malloc(sizeof(Vertex));
    // 为新节点赋值并建立该节点的链表
    v->val = val;
    v->linked = newLinklist(v);
    return v;
}

/* 定点节点释放函数 */
void freeVertex(Vertex *val) {
    // 释放该节点和该节点的链表的内存
    freeLinklist(val->linked);
    free(val);
}

/* 链表 */
struct linkList {
    Node *head;
    Node *tail;
};

/* 头插法 */
void pushFront(linkList *l, Vertex *val) {
    Node *temp = newNode();
    temp->val = val;
    temp->next = l->head->next;
    l->head->next = temp;
    if (l->tail == l->head) {
        l->tail = temp;
    }
}

/* 链表尾部插入 */
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

/* 根据索引查找链表中节点 */
Node *findByindex(linkList *l, unsigned int index) {
    unsigned int i = 0;
    Node *temp = l->head->next;
    while (temp != 0) {
        if (i == index) {
            return temp;
        }
        temp = temp->next;
        i++;
    }

    if (temp->next == 0) {
        printf("vertex not found!\n");
        return 0;
    }
    return 0;
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
    // 顶点链表
    linkList *verticesList;
    // 顶点数量
    unsigned int size;
};

typedef struct graphAdjList graphAdjList;

/* 添加边 */
void addEdge(graphAdjList *t, int i, int j) {
    // 越界检查
    if (i < 0 || j < 0 || i == j || i >= t->size || j >= t->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }
    // 查找待连接的节点
    Node *v1 = findByindex(t->verticesList, i);
    Node *v2 = findByindex(t->verticesList, j);
    // 连接节点
    pushBack(v1->val->linked, v2->val);
    pushBack(v2->val->linked, v1->val);
}

/* 删除边 */
void removeEdge(graphAdjList *t, int i, int j) {
    // 越界检查
    if (i < 0 || j < 0 || i == j || i >= t->size || j >= t->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }

    // 查找待删除边的相关节点
    Node *v1 = findByindex(t->verticesList, i);
    Node *v2 = findByindex(t->verticesList, j);
    // 移除待删除边
    removeLink(v1->val->linked, v2->val);
    removeLink(v2->val->linked, v1->val);
}

/* 添加顶点 */
void addVertex(graphAdjList *t, int val) {
    // 声明新顶点
    t->size++;
    Vertex *temp = newVertex(val);
    pushBack(t->verticesList, temp);
}

/* 删除顶点 */
void removeVertex(graphAdjList *t, unsigned int index) {
    // 越界检查
    if (index < 0 || index >= t->size) {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }

    // 查找待删节点
    Node *v = findByindex(t->verticesList, index);
    // 若不存在该节点，则返回
    if (v == 0) {
        printf("index is:%d\n", index);
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }

    // 遍历待删除节点链表，将所有与待删除结点有关的边删除
    Node *temp = v->val->linked->head->next;
    while (temp != 0) {
        removeLink(temp->val->linked, v->val);
        temp = temp->next;
    }

    // 移除待删除结点
    removeNode(t->verticesList, v->val);
    t->size--;
}

/* 打印顶点与邻接矩阵 */
void printGraph(graphAdjList *t) {
    Node *temp = t->verticesList->head->next;
    printf("邻接表  =\n");
    while (temp != 0) {
        Node *t = temp->val->linked->head->next;
        printf("%d: [", temp->val->val);
        while (t != 0) {
            if (t->next != 0) {
                printf("%d, ", t->val->val);
            } else {
                printf("%d", t->val->val);
            }
            t = t->next;
        }
        printf("]\n");
        temp = temp->next;
    }
}

/* 构造函数 */
graphAdjList *newGraphic() {
    // 申请内存
    graphAdjList *newGraph = (graphAdjList *)malloc(sizeof(graphAdjList));
    // 建立节点表
    newGraph->verticesList = newLinklist(0);
    return newGraph;
}

/* Driver Code */
int main() {

    /* 初始化无向图 */
    graphAdjList *graph = newGraphic();
    // 初始化顶点
    addVertex(graph, 1);
    addVertex(graph, 3);
    addVertex(graph, 2);
    addVertex(graph, 5);
    addVertex(graph, 4);
    // 初始化边
    addEdge(graph, 0, 1);
    addEdge(graph, 0, 3);
    addEdge(graph, 1, 2);
    addEdge(graph, 2, 3);
    addEdge(graph, 2, 4);
    addEdge(graph, 3, 4);
    printf("\n初始化后，图为:\n");
    printGraph(graph);

    /* 添加边 */
    // 顶点 1, 2 的索引分别为 0, 2
    addEdge(graph, 0, 2);
    printf("\n添加边 1-2 后图为\n");
    printGraph(graph);

    /* 删除边 */
    // 顶点 1, 3 的索引分别为 0, 1
    removeEdge(graph, 0, 1);
    printf("\n删除边 1-3 后，图为\n");
    printGraph(graph);

    /* 添加顶点 */
    addVertex(graph, 6);
    printf("\n添加顶点 6 后，图为\n");
    printGraph(graph);

    /* 删除顶点 */
    // 顶点 3 的索引为 1
    removeVertex(graph, 1);
    printf("\n删除顶点 3 后，图为\n");
    printGraph(graph);

    return 0;
}
