/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: Krahets (krahets@163.com)
 */

package chapter_graph;

import include.*;

import java.security.KeyStore.Entry;
import java.util.*;

/* 顶点类 */
class Vertex {
    int val;
    public Vertex(int val) {
        this.val = val;
    }
}

/* 基于邻接表表示的无向图类 */
class GraphAdjList {
    List<Vertex> vertices;            // 顶点列表
    Map<Vertex, Set<Vertex>> adjList; // 邻接表（使用哈希表实现）

    public GraphAdjList(Vertex[] vertices, Vertex[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjList = new HashMap<>();
        // 添加顶点
        for (Vertex vertex : vertices) {
            addVertex(vertex);
        }
        // 添加边
        for (Vertex[] edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* 获取顶点数量 */
    public int size() {
        return vertices.size();
    }

    /* 添加顶点 */
    public void addVertex(Vertex vet) {
        // 在顶点列表尾部添加新顶点的值
        vertices.add(vet);
        // 在邻接表中添加一个新链表（即 HashSet）
        adjList.put(vet, new HashSet<>());
    }

    /* 删除顶点 */
    public void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet))
            throw new IndexOutOfBoundsException();
        // 在顶点列表中移除 vet
        vertices.remove(vet);
        // 在邻接表中删除 vet 对应的链表（即 HashSet）
        adjList.remove(vet);
        // 遍历其它顶点的链表（即 HashSet），删除所有与 vet 相关的边
        for (Set<Vertex> set : adjList.values()) {
            set.remove(vet);
        }
    }

    /* 添加边 */
    public void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2))
            throw new IndexOutOfBoundsException();
        adjList.get(vet1).add(vet2);
        adjList.get(vet2).add(vet1);
    }

    /* 删除边 */
    public void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2))
            throw new IndexOutOfBoundsException();
        adjList.get(vet1).remove(vet2);
        adjList.get(vet2).remove(vet1);
    }

    /* 打印邻接表 */
    public void print() {
        System.out.print("顶点列表 = ");
        List<Integer> vals = new ArrayList<>();
        for (Vertex vertex : vertices)
            vals.add(vertex.val);
        System.out.println(vals);
        System.out.println("邻接表 =");
        for (Map.Entry<Vertex, Set<Vertex>> entry : adjList.entrySet()) {
            List<Integer> tmp = new ArrayList<>();
            for (Vertex vertex : entry.getValue())
                tmp.add(vertex.val);
            System.out.println(entry.getKey().val + ": " + tmp + ",");
        }
    }
}

public class graph_adjacency_list {
    public static void main(String[] args) {
        /* 初始化无向图 */
        Vertex v0 = new Vertex(1),
               v1 = new Vertex(3),
               v2 = new Vertex(2),
               v3 = new Vertex(5),
               v4 = new Vertex(4);
        Vertex[] vertices = { v0, v1, v2, v3, v4 };
        Vertex[][] edges = { { v0, v1 }, { v1, v2 }, { v2, v3 }, { v0, v3 }, { v2, v4 }, { v3, v4 } };
        GraphAdjList graph = new GraphAdjList(vertices, edges);
        System.out.println("\n初始化后，图为");
        graph.print();

        /* 添加顶点 */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        System.out.println("\n添加顶点 6 后，图为");
        graph.print();

        /* 删除顶点 */
        graph.removeVertex(v1);
        System.out.println("\n删除顶点 3 后，图为");
        graph.print();

        /* 添加边 */
        graph.addEdge(v0, v2);
        System.out.println("\n添加边 1-2 后，图为");
        graph.print();

        /* 删除边 */
        graph.removeEdge(v0, v3);
        System.out.println("\n删除边 1-5 后，图为");
        graph.print();
    }
}
