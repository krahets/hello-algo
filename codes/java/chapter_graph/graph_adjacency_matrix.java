/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: Krahets (krahets@163.com)
 */

package chapter_graph;

import include.*;
import java.util.*;

/* 基于邻接矩阵表示的无向图类 */
class Graph {
    List<Integer> vertices;     // 顶点列表，元素代表顶点值
    List<List<Integer>> adjMat; // 邻接矩阵

    public Graph(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // 添加顶点
        for (int val : vertices) {
            addVertex(val);
        }
        // 添加边
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* 获取顶点数量 */
    public int size() {
        return vertices.size();
    }

    /* 添加顶点 */
    public void addVertex(int val) {
        int n = size();
        // 向顶点列表中添加新顶点的值
        vertices.add(val);
        // 在邻接矩阵中添加一行
        List<Integer> newRow = new ArrayList<>(n);
        for (int j = 0; j < n; j++) {
            newRow.add(0);
        }
        adjMat.add(newRow);
        // 在邻接矩阵中添加一列
        for (List<Integer> row : adjMat) {
            row.add(0);
        }
    }

    /* 删除顶点 index */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // 在顶点列表中移除索引 index 的顶点
        vertices.remove(index);
        // 在邻接矩阵中删除索引 index 的行
        adjMat.remove(index);
        // 在邻接矩阵中删除索引 index 的列
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* 添加顶点 i, j 之间的边 */
    public void addEdge(int i, int j) {
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // 在无向图中，邻接矩阵沿主对角线对称，即满足 (i, j) == (j, i)
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* 删除顶点 i, j 之间的边 */
    public void removeEdge(int i, int j) {
        // 索引越界与相等处理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        adjMat.get(i).set(j, 0);
        adjMat.get(j).set(i, 0);
    }

    /* 打印邻接矩阵 */
    public void print() {
        System.out.print("顶点列表 = ");
        System.out.println(vertices);
        System.out.println("邻接矩阵 =");
        PrintUtil.printMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    public static void main(String[] args) {
        /* 初始化无向图 */
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 1, 2 }, { 2, 3 }, { 0, 3 }, { 2, 4 }, { 3, 4 } };
        Graph graph = new Graph(vertices, edges);
        System.out.println("\n初始化后，图为");
        graph.print();

        /* 添加顶点 */
        graph.addVertex(6);
        System.out.println("\n添加值为 6 的顶点后，图为");
        graph.print();

        /* 删除顶点 */
        graph.removeVertex(1);
        System.out.println("\n删除索引为 1 的顶点后，图为");
        graph.print();

        /* 添加边 */
        graph.addEdge(0, 1);
        System.out.println("\n添加边 (0, 1) 后，图为");
        graph.print();

        /* 删除边 */
        graph.removeEdge(0, 2);
        System.out.println("\n删除边 (0, 2)，图为");
        graph.print();
    }
}
