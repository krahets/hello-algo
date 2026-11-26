/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import utils.*;
import java.util.*;

/* 以鄰接矩陣實作的無向圖類別 */
class GraphAdjMat {
    List<Integer> vertices; // 頂點清單，元素代表頂點值，索引代表頂點索引
    List<List<Integer>> adjMat; // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

    /* 建構式 */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // 新增頂點
        for (int val : vertices) {
            addVertex(val);
        }
        // 新增邊
        // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* 取得頂點數量 */
    public int size() {
        return vertices.size();
    }

    /* 新增頂點 */
    public void addVertex(int val) {
        int n = size();
        // 將新頂點的值加入頂點清單
        vertices.add(val);
        // 在鄰接矩陣中新增一個橫列
        List<Integer> newRow = new ArrayList<>(n);
        for (int j = 0; j < n; j++) {
            newRow.add(0);
        }
        adjMat.add(newRow);
        // 在鄰接矩陣中新增一個直行
        for (List<Integer> row : adjMat) {
            row.add(0);
        }
    }

    /* 刪除頂點 */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // 從頂點清單中移除索引為 index 的頂點
        vertices.remove(index);
        // 從鄰接矩陣中刪除索引為 index 的橫列
        adjMat.remove(index);
        // 從鄰接矩陣中刪除索引為 index 的直行
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* 新增邊 */
    // 參數 i、j 為 vertices 中的元素索引
    public void addEdge(int i, int j) {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* 刪除邊 */
    // 參數 i、j 為 vertices 中的元素索引
    public void removeEdge(int i, int j) {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        adjMat.get(i).set(j, 0);
        adjMat.get(j).set(i, 0);
    }

    /* 印出鄰接矩陣 */
    public void print() {
        System.out.print("頂點清單 = ");
        System.out.println(vertices);
        System.out.println("鄰接矩陣 =");
        PrintUtil.printMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    public static void main(String[] args) {
        /* 初始化無向圖 */
        // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\n初始化後的圖為");
        graph.print();

        /* 新增邊 */
        // 頂點 1、2 的索引分別為 0、2
        graph.addEdge(0, 2);
        System.out.println("\n新增邊 1-2 後的圖為");
        graph.print();

        /* 刪除邊 */
        // 頂點 1、3 的索引分別為 0、1
        graph.removeEdge(0, 1);
        System.out.println("\n刪除邊 1-3 後的圖為");
        graph.print();

        /* 新增頂點 */
        graph.addVertex(6);
        System.out.println("\n新增頂點 6 後的圖為");
        graph.print();

        /* 刪除頂點 */
        // 頂點 3 的索引為 1
        graph.removeVertex(1);
        System.out.println("\n刪除頂點 3 後的圖為");
        graph.print();
    }
}
