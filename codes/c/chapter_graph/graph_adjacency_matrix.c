/**
 * File: graph_adjacency_matrix.c
 * Created Time: 2023-07-06
 * Author: NI-SW (947743645@qq.com)
 */

#include "../utils/common.h"

/* 基于邻接矩阵实现的无向图类结构 */
typedef struct graphAdjMat graphAdjMat;
struct graphAdjMat
{
    int* vertices;
    unsigned int** adjMat;
    unsigned int sizei;
    unsigned int true_sizei;

    graphAdjMat* self;    
    void (*addVertex)(graphAdjMat* t, int val);
    unsigned int (*size)(graphAdjMat* t);
    void (*addEdge)(graphAdjMat* t, unsigned int vertice_1, unsigned int vertice_2);
    void (*removeVertex)(graphAdjMat* t, unsigned int vertice);
    void (*removeEdge)(graphAdjMat* t, unsigned int vertice_1, unsigned int vertice_2);
    void (*print_graph)(graphAdjMat* t);
};


/* 获取顶点数量 */
unsigned int size(graphAdjMat* t)
{
    return t->sizei;
}

/* 添加边 */
void addEdge(graphAdjMat* t, unsigned int vertice_1, unsigned int vertice_2)
{
    //越界检查
    if(vertice_1 >= t->sizei || vertice_2 >= t->sizei || vertice_1 < 0 || vertice_2 < 0 || vertice_1 == vertice_2)
    {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }
    
    t->adjMat[vertice_1][vertice_2] = t->adjMat[vertice_2][vertice_1] = 1;

}

/* 删除边 */
void removeEdge(graphAdjMat* t, unsigned int vertice_1, unsigned int vertice_2) 
{
    //越界检查
    if(vertice_1 >= t->sizei || vertice_2 >= t->sizei || vertice_1 < 0 || vertice_2 < 0 || vertice_1 == vertice_2)
    {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }
    t->adjMat[vertice_1][vertice_2] = t->adjMat[vertice_2][vertice_1] = 0;

}

/* 添加顶点 */
void addVertex(graphAdjMat* t, int val) 
{
    //如果实际使用不大于预设空间，则直接初始化新空间
    if(t->sizei < t->true_sizei)
    {
        t->vertices[t->sizei] = val;

        //邻接矩新列阵置0
        for(int i = 0; i < t->sizei; i++)
        {
            t->adjMat[i][t->sizei] = 0;
        }
        memset(t->adjMat[t->sizei], 0, sizeof(unsigned int) * (t->sizei + 1));
        t->sizei++;
        return;
    }
    
    //扩容，申请新的顶点数组
    int* temp = (int*)malloc(sizeof(int) * (t->sizei * 2));
    memcpy(temp, t->vertices, sizeof(int) * t->sizei);
    temp[t->sizei] = val;

    //释放原数组
    free(t->vertices);
    t->vertices = temp;
    
    //扩容，申请新的二维数组
    unsigned int** temp_Mat = (unsigned int**)malloc(sizeof(unsigned int*) * t->sizei * 2);
    unsigned int* temp_Mat_line = (unsigned int*)malloc(sizeof(unsigned int) * (t->sizei * 2) * (t->sizei * 2));
    memset(temp_Mat_line, 0,  sizeof(unsigned int) * (t->sizei * 2) * (t->sizei * 2));
    for(int k = 0; k < t->sizei * 2; k++)
    {
        temp_Mat[k] = temp_Mat_line + k * (t->sizei * 2);
    }
    
    //原数据复制到新数组
    for(int i = 0;i < t->sizei;i++)
    {
        memcpy(temp_Mat[i], t->adjMat[i], sizeof(unsigned int) * t->sizei);
    }

    //新列置0
    for(int i = 0;i < t->sizei;i++)
    {
        temp_Mat[i][t->sizei] = 0;
    }
    memset(temp_Mat[t->sizei], 0, sizeof(unsigned int) * (t->sizei + 1));

    //释放原数组
    free(t->adjMat[0]);
    free(t->adjMat);

    //扩容后，指向新地址
    t->adjMat = temp_Mat;
    t->true_sizei = t->sizei * 2;
    t->sizei++;

}

/* 删除顶点 */
void removeVertex(graphAdjMat* t, unsigned int vertice)
{
    //越界检查
    if(vertice >= t->sizei || vertice < 0)
    {
        printf("Out of range in %s:%d\n", __FILE__, __LINE__);
        exit(1);
    }
    
    //清除删除的顶点
    for(int i = vertice; i < t->sizei - 1; i++)
    {
        t->vertices[i] = t->vertices[i + 1];
    }

    //清除邻接矩阵中删除的列
    for(int i = 0; i < t->sizei - 1; i++)
    { 
        if(i < vertice)
        {
            //被删除列后的所有列前移
            for(int j = vertice; j < t->sizei - 1; j++)
            {
                t->adjMat[i][j] = t->adjMat[i][j + 1];            
            }
        }
        else
        {
            //被删除行的下方所有行上移
            memcpy(t->adjMat[i],t->adjMat[i + 1], sizeof(unsigned int) * t->sizei);
            //被删除列后的所有列前移
            for(int j = vertice; j < t->sizei; j++)
            {
                t->adjMat[i][j] = t->adjMat[i][j + 1];            
            }
        }
    }
    t->sizei--;
}

/* 打印顶点与邻接矩阵 */
void print_graph(graphAdjMat* t)
{
    if(t->sizei == 0)
    {
        printf("graph is empty\n");
        return;
    }
    printf("顶点值:\n");
    for(int i = 0; i < t->sizei; i++)
    {
        printf("%d\t", t->vertices[i]);
    }
    printf("\n邻接矩阵:\n");
    for(int i = 0;i < t->size(t->self); i++)
    {
        for(int j = 0; j < t->size(t->self); j++)
        {
            printf("%u\t", t->adjMat[i][j]);
        }
        printf("\n\n\n");
    }
}

/* 构造函数 */
void graphic(graphAdjMat* t, unsigned int number_vertices, int* vertices, unsigned int** adjMat)
{    
    //函数指针
    t->addVertex = addVertex;
    t->size = size;
    t->addEdge = addEdge;
    t->removeVertex = removeVertex;
    t->removeEdge = removeEdge;
    t->print_graph = print_graph;    
    t->self = t;

    //申请内存
    t->vertices = (int*)malloc(sizeof(int) * number_vertices * 2);
    t->adjMat = (unsigned int**)malloc(sizeof(unsigned int*) * number_vertices * 2);
    unsigned int* temp = (unsigned int*)malloc(sizeof(unsigned int) * number_vertices * 2 * number_vertices * 2);
    t->sizei = number_vertices;
    t->true_sizei = number_vertices * 2;

    //配置二维数组
    for(int i = 0; i < number_vertices * 2; i++)
    {
        t->adjMat[i] =  temp + i * number_vertices * 2;
    }

    //赋值
    memcpy(t->vertices, vertices, sizeof(int) * number_vertices);
    for(int i = 0; i < number_vertices; i++)
    { 
        memcpy(t->adjMat[i], adjMat[i], sizeof(unsigned int) * number_vertices);
    }

}

/* Driver Code */
int main() 
{
    //声明图结构
    graphAdjMat s;

    //创建初始图
    int p[5] = {1,2,3,4,5};
    unsigned int** pp = (unsigned int**)malloc(sizeof(unsigned int*) * 5); 
    unsigned int* temp = (unsigned int*)malloc(sizeof(unsigned int) * 25);
    memset(temp, 0,sizeof(unsigned int) * 25);
    for(int k=0; k < 5; k++)
    {
        pp[k] = temp + k * 5;
    }
    pp[1][3] = pp[3][1] = 1;
    pp[2][4] = pp[4][2] = 1;

    //构造初始图结构
    graphic(&s, 5, p, pp);
    free(pp);
    free(temp);
    printf("构造图:\n");
    s.print_graph(s.self);
    
    //增加顶点
    for(int i = 0;i < 10; i++)
    {
        s.addVertex(s.self, i * 2);
    }
    printf("添加顶点:\n");    
    s.print_graph(s.self);

    //添加边
    s.addEdge(s.self, 1, 6);
    s.addEdge(s.self, 2, 7);
    s.addEdge(s.self, 3, 8);
    s.addEdge(s.self, 4, 9);
    s.addEdge(s.self, 2, 1);
    printf("添加边:\n");
    s.print_graph(s.self);

    //删除边
    s.removeEdge(s.self, 2, 7);
    s.removeEdge(s.self, 3, 8);
    printf("删除边:\n");
    s.print_graph(s.self);

    //删除顶点
    s.removeVertex(s.self, 1);
    s.removeVertex(s.self, 8);
    printf("删除顶点:\n");   
    s.print_graph(s.self);
    
    //删除全部顶点
    for(int i = s.size(s.self) - 1; i >= 0; i--)
        s.removeVertex(s.self,i);
    s.print_graph(s.self);

    return 0;
}
