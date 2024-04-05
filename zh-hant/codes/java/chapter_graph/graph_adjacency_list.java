/**
 * File: graph_adjacency_list.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

/* 基於鄰接表實現的無向圖類別 */
class GraphAdjList {
    // 鄰接表，key：頂點，value：該頂點的所有鄰接頂點
    Map<Vertex, List<Vertex>> adjList;

    /* 建構子 */
    public GraphAdjList(Vertex[][] edges) {
        this.adjList = new HashMap<>();
        // 新增所有頂點和邊
        for (Vertex[] edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 獲取頂點數量 */
    public int size() {
        return adjList.size();
    }

    /* 新增邊 */
    public void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // 新增邊 vet1 - vet2
        adjList.get(vet1).add(vet2);
        adjList.get(vet2).add(vet1);
    }

    /* 刪除邊 */
    public void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // 刪除邊 vet1 - vet2
        adjList.get(vet1).remove(vet2);
        adjList.get(vet2).remove(vet1);
    }

    /* 新增頂點 */
    public void addVertex(Vertex vet) {
        if (adjList.containsKey(vet))
            return;
        // 在鄰接表中新增一個新鏈結串列
        adjList.put(vet, new ArrayList<>());
    }

    /* 刪除頂點 */
    public void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet))
            throw new IllegalArgumentException();
        // 在鄰接表中刪除頂點 vet 對應的鏈結串列
        adjList.remove(vet);
        // 走訪其他頂點的鏈結串列，刪除所有包含 vet 的邊
        for (List<Vertex> list : adjList.values()) {
            list.remove(vet);
        }
    }

    /* 列印鄰接表 */
    public void print() {
        System.out.println("鄰接表 =");
        for (Map.Entry<Vertex, List<Vertex>> pair : adjList.entrySet()) {
            List<Integer> tmp = new ArrayList<>();
            for (Vertex vertex : pair.getValue())
                tmp.add(vertex.val);
            System.out.println(pair.getKey().val + ": " + tmp + ",");
        }
    }
}

public class graph_adjacency_list {
    public static void main(String[] args) {
        /* 初始化無向圖 */
        Vertex[] v = Vertex.valsToVets(new int[] { 1, 3, 2, 5, 4 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[3] }, { v[2], v[4] }, { v[3], v[4] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初始化後，圖為");
        graph.print();

        /* 新增邊 */
        // 頂點 1, 2 即 v[0], v[2]
        graph.addEdge(v[0], v[2]);
        System.out.println("\n新增邊 1-2 後，圖為");
        graph.print();

        /* 刪除邊 */
        // 頂點 1, 3 即 v[0], v[1]
        graph.removeEdge(v[0], v[1]);
        System.out.println("\n刪除邊 1-3 後，圖為");
        graph.print();

        /* 新增頂點 */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        System.out.println("\n新增頂點 6 後，圖為");
        graph.print();

        /* 刪除頂點 */
        // 頂點 3 即 v[1]
        graph.removeVertex(v[1]);
        System.out.println("\n刪除頂點 3 後，圖為");
        graph.print();
    }
}
