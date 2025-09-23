/**
 * File: graph_adjacency_list.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

/* 隣接リストに基づく無向グラフクラス */
class GraphAdjList {
    // 隣接リスト、キー: 頂点、値: その頂点のすべての隣接頂点
    Map<Vertex, List<Vertex>> adjList;

    /* コンストラクタ */
    public GraphAdjList(Vertex[][] edges) {
        this.adjList = new HashMap<>();
        // すべての頂点と辺を追加
        for (Vertex[] edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 頂点数を取得 */
    public int size() {
        return adjList.size();
    }

    /* 辺を追加 */
    public void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // 辺 vet1 - vet2 を追加
        adjList.get(vet1).add(vet2);
        adjList.get(vet2).add(vet1);
    }

    /* 辺を削除 */
    public void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // 辺 vet1 - vet2 を削除
        adjList.get(vet1).remove(vet2);
        adjList.get(vet2).remove(vet1);
    }

    /* 頂点を追加 */
    public void addVertex(Vertex vet) {
        if (adjList.containsKey(vet))
            return;
        // 隣接リストに新しい連結リストを追加
        adjList.put(vet, new ArrayList<>());
    }

    /* 頂点を削除 */
    public void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet))
            throw new IllegalArgumentException();
        // 隣接リストから頂点 vet に対応する連結リストを削除
        adjList.remove(vet);
        // 他の頂点の連結リストを走査し、vet を含むすべての辺を削除
        for (List<Vertex> list : adjList.values()) {
            list.remove(vet);
        }
    }

    /* 隣接リストを出力 */
    public void print() {
        System.out.println("隣接リスト =");
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
        /* 無向グラフを初期化 */
        Vertex[] v = Vertex.valsToVets(new int[] { 1, 3, 2, 5, 4 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[3] }, { v[2], v[4] }, { v[3], v[4] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初期化後、グラフは");
        graph.print();

        /* 辺を追加 */
        // 頂点 1、2、すなわち v[0]、v[2]
        graph.addEdge(v[0], v[2]);
        System.out.println("\n辺 1-2 を追加後、グラフは");
        graph.print();

        /* 辺を削除 */
        // 頂点 1、3、すなわち v[0]、v[1]
        graph.removeEdge(v[0], v[1]);
        System.out.println("\n辺 1-3 を削除後、グラフは");
        graph.print();

        /* 頂点を追加 */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        System.out.println("\n頂点 6 を追加後、グラフは");
        graph.print();

        /* 頂点を削除 */
        // 頂点 3、すなわち v[1]
        graph.removeVertex(v[1]);
        System.out.println("\n頂点 3 を削除後、グラフは");
        graph.print();
    }
}