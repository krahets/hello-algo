/**
 * File: graph_dfs.c
 * Created Time: 2023-07-13
 * Author: NI-SW (947743645@qq.com)
 */

#include "graph_adjacency_list.c"

/* 哈希表 */
typedef struct {
    unsigned int size;
    unsigned int *array;
} HashTable;

/* 初始化哈希表 */
HashTable *newHash(unsigned int size) {
    HashTable *h = (HashTable *)malloc(sizeof(HashTable));
    h->array = (unsigned int *)malloc(sizeof(unsigned int) * size);
    memset(h->array, 0, sizeof(unsigned int) * size);
    h->size = size;
    return h;
}

/* 标记索引过的顶点 */
void hashMark(HashTable *h, int index) {
    h->array[index % h->size] = 1;
}

/* 查询顶点是否已被标记 */
int hashQuery(HashTable *h, int index) {
    // 若顶点已被标记，则返回 1
    if (h->array[index % h->size] == 1) {
        return 1;
    } else {
        return 0;
    }
}

/* 释放哈希表内存 */
void freeHash(HashTable *h) {
    free(h->array);
    free(h);
}

/* 深度优先遍历 DFS 辅助函数 */
int resIndex = 0;
void dfs(GraphAdjList *graph, HashTable *visited, Vertex *vet, Vertex **res) {
    if (hashQuery(visited, vet->pos) == 1) {
        return; // 跳过已被访问过的顶点
    }
    hashMark(visited, vet->pos); // 标记顶点并将顶点存入数组
    res[resIndex] = vet;         // 将顶点存入数组
    resIndex++;
    // 遍历该顶点链表
    Node *n = vet->list->head->next;
    while (n != 0) {
        // 递归访问邻接顶点
        dfs(graph, visited, n->val, res);
        n = n->next;
    }
    return;
}

/* 深度优先遍历 DFS */
// 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
Vertex **graphDFS(GraphAdjList *graph, Vertex *startVet) {
    // 顶点遍历序列
    Vertex **res = (Vertex **)malloc(sizeof(Vertex *) * graph->size);
    memset(res, 0, sizeof(Vertex *) * graph->size);
    // 哈希表，用于记录已被访问过的顶点
    HashTable *visited = newHash(graph->size);
    dfs(graph, visited, startVet, res);
    // 释放哈希表内存并将数组索引归零
    freeHash(visited);
    resIndex = 0;
    // 返回遍历数组
    return res;
}

/* Driver Code */
int main() {
    GraphAdjList *graph = newGraphAdjList(10);
    for (int i = 0; i < 7; i++) {
        addVertex(graph, i);
    }
    addEdge(graph, 0, 1);
    addEdge(graph, 0, 3);
    addEdge(graph, 1, 2);
    addEdge(graph, 2, 5);
    addEdge(graph, 5, 4);
    addEdge(graph, 5, 6);
    printf("\n初始化后，图为:\n");
    printGraph(graph);

    // 深度优先遍历 DFS
    Vertex **vet = graphDFS(graph, graph->vertices[0]);

    // 输出遍历结果
    printf("\n深度优先遍历（DFS）顶点序列为\n");
    printf("[");
    printf("%d", vet[0]->val);
    for (int i = 1; i < graph->size && vet[i] != 0; i++) {
        printf(", %d", vet[i]->val);
    }
    printf("]\n");

    // 释放内存
    free(vet);
    return 0;
}
