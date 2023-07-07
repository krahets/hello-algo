/**
 * File: graph_adjacency_list.c
 * Created Time: 2023-07-07
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

typedef struct Vertex Vertex;
typedef struct Link_list Link_list;    
typedef struct node node;
typedef struct graphAdjList graphAdjList;

void free_Vertex(Vertex* t);

/* 节点 */
struct node
{
    Vertex* val;
    node* next;
};
node* new_node()
{
    node* temp = (node*)malloc(sizeof(node));
    temp->next = 0;
    temp->val = 0;
    return temp;
}

/* 链表 */
struct Link_list
{
    node* head;
    node* tail;
    void (*push_front)(Link_list* t, Vertex* val);
    void (*push_back)(Link_list* t, Vertex* val);
    void (*remove_node)(Link_list* t, Vertex* val);
    void (*remove_edge)(Link_list* t, Vertex* val);
    void (*free_Link_list)(Link_list* t);
    node* (*find_by_index)(Link_list* t, unsigned int index);
};
void push_front(Link_list* t, Vertex* val)
{
    node* temp = new_node();
    temp->val = val;
    temp->next = t->head->next;
    t->head->next = temp;
    if(t->tail == t->head)
    {
        t->tail = temp;
    }
}
void push_back(Link_list* t, Vertex* val)
{
    node* temp = new_node();
    temp->val = val;
    temp->next = 0;
    t->tail->next = temp;
    t->tail = temp;
}
void remove_edge(Link_list* t, Vertex* val)
{
    node* temp = t->head->next;
    node* front = t->head;
    while(temp != 0)
    {
        if(temp->val == val)
        {
            front->next = temp->next;
            if(t->tail == temp)
            {
                t->tail = front;
            }
            free(temp);
            return;
        }
        front = temp;
        temp = temp->next;
    }

    if(temp->next == 0)
    {
        printf("vertex not found!\n");
    }
}
node* find_by_index(Link_list* t, unsigned int index)
{
    unsigned int i = 0;
    node* temp = t->head->next;
    node* front = t->head;
    while(temp != 0)
    {
        if(i == index)
        {
            return temp;
        }
        temp = temp->next;
        i++;
    }

    if(temp->next == 0)
    {
        printf("vertex not found!\n");
        return 0;
    }
}
void remove_node(Link_list* t, Vertex* val)
{
    node* temp = t->head->next;
    node* front = t->head;
    while(temp != 0)
    {
        if(temp->val == val)
        {
            front->next = temp->next;
            if(t->tail == temp)
            {
                t->tail = front;
            }
            free_Vertex(val);
            free(temp);
            return;
        }
        front = temp;
        temp = temp->next;
    }

    if(temp->next == 0)
    {
        printf("vertex not found!\n");
    }

}
void free_Link_list(Link_list* t)
{
    node* temp = t->head->next;
    while(temp != 0)
    {
        free(t->head);
        t->head = temp;
        temp = temp->next;
    }
    free(t->head);
    t->head = 0;
    free(t);
}
Link_list* new_Linklist(Vertex* s)
{
    Link_list* t = (Link_list*)malloc(sizeof(Link_list));
    t->remove_edge = remove_edge;
    t->push_back = push_back;
    t->push_front = push_front;
    t->remove_node = remove_node;
    t->free_Link_list = free_Link_list;
    t->find_by_index = find_by_index;

    t->head = new_node();
    t->head->val = s;
    t->tail = t->head;
    t->head->next = 0;

    return t;
}

/* 节点类 */
struct Vertex
{
    //节点值
    int val;
    //与其它节点相连接的边的链表
    Link_list* linked;
};
Vertex* new_Vertex(int val)
{
    Vertex* t = (Vertex*)malloc(sizeof(Vertex));
    //为新节点赋值并建立该节点的链表
    t->val = val;
    t->linked = new_Linklist(t);
    return t;
}
void free_Vertex(Vertex* t)
{
    //释放该节点和该节点的链表的内存
    free_Link_list(t->linked);
    free(t);
}

/* 基于邻接链表实现的无向图类结构 */
struct graphAdjList
{
    //顶点链表
    Link_list* vertices_list;
    //顶点数量
    unsigned int sizei;
    graphAdjList* self;
    void (*addVertex)(graphAdjList* t, int val);
    unsigned int (*size)(graphAdjList* t);
    void (*addEdge)(graphAdjList* t, unsigned int vertice_1, unsigned int vertice_2);
    void (*removeVertex)(graphAdjList* t, unsigned int vertice);
    void (*removeEdge)(graphAdjList* t, unsigned int vertice_1, unsigned int vertice_2);
    void (*print_graph)(graphAdjList* t);
};

/* 获取顶点数量 */
unsigned int size(graphAdjList* t)
{
    return t->sizei;
}

/* 添加边 */
void addEdge(graphAdjList* t, unsigned int index_1, unsigned int index_2)
{
    //越界检查
    if(index_1 >= t->sizei || index_2 >= t->sizei || index_1 < 0 || index_2 < 0 || index_1 == index_2)
    {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }
    //查找待连接的节点
    node* v1 = t->vertices_list->find_by_index(t->vertices_list, index_1);
    node* v2 = t->vertices_list->find_by_index(t->vertices_list, index_2);
    //连接节点
    v1->val->linked->push_front(v1->val->linked, v2->val);
    v2->val->linked->push_front(v2->val->linked, v1->val);

}

/* 删除边 */
void removeEdge(graphAdjList* t, unsigned int index_1, unsigned int index_2) 
{
    //越界检查
    if(index_1 >= t->sizei || index_2 >= t->sizei || index_1 < 0 || index_2 < 0 || index_1 == index_2)
    {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }
    
    //查找待删除边的相关节点
    node* v1 = t->vertices_list->find_by_index(t->vertices_list, index_1);
    node* v2 = t->vertices_list->find_by_index(t->vertices_list, index_2);
    //移除待删除边
    v1->val->linked->remove_edge(v1->val->linked, v2->val);
    v2->val->linked->remove_edge(v2->val->linked, v1->val);
}

/* 添加顶点 */
void addVertex(graphAdjList* t, int val) 
{
    //声明新顶点
    t->sizei++;
    Vertex* temp = new_Vertex(val);
    t->vertices_list->push_front(t->vertices_list, temp);
}

/* 删除顶点 */
void removeVertex(graphAdjList* t, unsigned int index)
{
    //越界检查
    if(index >= t->sizei || index < 0)
    {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }
    
    //遍历节点表，寻找待删节点
    node* temp = t->vertices_list->head->next;

    //查找待删节点
    node* v = t->vertices_list->find_by_index(t->vertices_list, index);
    //若不存在该节点，则返回
    if(v == 0)
    {
        printf("index is:%d\n", index);
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        return;
    }

    //遍历待删除节点链表，将所有与待删除结点有关的边删除
    temp = v->val->linked->head->next;
    while(temp != 0)
    {
        temp->val->linked->remove_edge(temp->val->linked, v->val);
        temp = temp->next;
    }

    //移除待删除结点
    t->vertices_list->remove_node(t->vertices_list, v->val);
    t->sizei--;
}

/* 打印顶点与邻接矩阵 */
void print_graph(graphAdjList* t)
{
    node* temp = t->vertices_list->head->next;
    printf("顶点\t边\n");
    while(temp != 0)
    {
        node* t = temp->val->linked->head->next;
        printf("%d\t", temp->val->val);
        while(t != 0)
        {
            printf("%d->", t->val->val);
            t = t->next;
        }
        printf("\n");
        temp = temp->next;
    }
}

/* 构造函数 */
void graphic(graphAdjList* t)
{    
    //函数指针
    t->addVertex = addVertex;
    t->size = size;
    t->addEdge = addEdge;
    t->removeVertex = removeVertex;
    t->removeEdge = removeEdge;
    t->print_graph = print_graph;    
    t->self = t;

    //建立节点表
    t->vertices_list = new_Linklist(0);
}

/* Driver Code */
int main() 
{

    //声明图结构
    graphAdjList s;

    //构造初始图结构
    graphic(&s);    

    //增加顶点
    for(int i = 9;i >= 0;i--)
    {
        s.addVertex(s.self, i);
    }
    printf("添加顶点:\n");
    s.print_graph(s.self);

    //添加边
    s.addEdge(s.self, 0, 2);
    s.addEdge(s.self, 0, 3);
    s.addEdge(s.self, 0, 4);
    s.addEdge(s.self, 1, 4);
    s.addEdge(s.self, 2, 6);
    s.addEdge(s.self, 4, 8);
    printf("添加边:\n");
    s.print_graph(s.self);

    //删除边
    s.removeEdge(s.self, 0, 2);
    s.removeEdge(s.self, 1, 4);
    printf("删除边:\n");
    s.print_graph(s.self);

    //删除顶点
    s.removeVertex(s.self, 0);
    printf("删除边:\n");
    s.print_graph(s.self);    

    //删除全部顶点
    for(int i = 1;i<10;i++)
    {
        s.removeVertex(s.self, 0); 
    }
    printf("删除全部顶点:\n");
    s.print_graph(s.self); 

    return 0;
}
