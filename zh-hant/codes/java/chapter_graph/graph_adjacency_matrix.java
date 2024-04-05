/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import utils.*;
import java.util.*;

/* 基於鄰接矩陣實現的無向圖類別 */
class GraphAdjMat {
    List<Integer> vertices; // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
    List<List<Integer>> adjMat; // 鄰接矩陣，行列索引對應“頂點索引”

    /* 建構子 */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // 新增頂點
        for (int val : vertices) {
            addVertex(val);
        }
        // 新增邊
        // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* 獲取頂點數量 */
    public int size() {
        return vertices.size();
    }

    /* 新增頂點 */
    public void addVertex(int val) {
        int n = size();
        // 向頂點串列中新增新頂點的值
        vertices.add(val);
        // 在鄰接矩陣中新增一行
        List<Integer> newRow = new ArrayList<>(n);
        for (int j = 0; j < n; j++) {
            newRow.add(0);
        }
        adjMat.add(newRow);
        // 在鄰接矩陣中新增一列
        for (List<Integer> row : adjMat) {
            row.add(0);
        }
    }

    /* 刪除頂點 */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // 在頂點串列中移除索引 index 的頂點
        vertices.remove(index);
        // 在鄰接矩陣中刪除索引 index 的行
        adjMat.remove(index);
        // 在鄰接矩陣中刪除索引 index 的列
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* 新增邊 */
    // 參數 i, j 對應 vertices 元素索引
    public void addEdge(int i, int j) {
        // 索引越界與相等處理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* 刪除邊 */
    // 參數 i, j 對應 vertices 元素索引
    public void removeEdge(int i, int j) {
        // 索引越界與相等處理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        adjMat.get(i).set(j, 0);
        adjMat.get(j).set(i, 0);
    }

    /* 列印鄰接矩陣 */
    public void print() {
        System.out.print("頂點串列 = ");
        System.out.println(vertices);
        System.out.println("鄰接矩陣 =");
        PrintUtil.printMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    public static void main(String[] args) {
        /* 初始化無向圖 */
        // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\n初始化後，圖為");
        graph.print();

        /* 新增邊 */
        // 頂點 1, 2 的索引分別為 0, 2
        graph.addEdge(0, 2);
        System.out.println("\n新增邊 1-2 後，圖為");
        graph.print();

        /* 刪除邊 */
        // 頂點 1, 3 的索引分別為 0, 1
        graph.removeEdge(0, 1);
        System.out.println("\n刪除邊 1-3 後，圖為");
        graph.print();

        /* 新增頂點 */
        graph.addVertex(6);
        System.out.println("\n新增頂點 6 後，圖為");
        graph.print();

        /* 刪除頂點 */
        // 頂點 3 的索引為 1
        graph.removeVertex(1);
        System.out.println("\n刪除頂點 3 後，圖為");
        graph.print();
    }
}
