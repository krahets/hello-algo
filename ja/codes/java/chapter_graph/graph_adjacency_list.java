/**
 * File: graph_adjacency_list.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

/* 隣接リストで実装した無向グラフクラス */
class GraphAdjList {
    // 隣接リスト。key：頂点、value：その頂点に隣接する全頂点
    Map<Vertex, List<Vertex>> adjList;

    /* コンストラクタ */
    public GraphAdjList(Vertex[][] edges) {
        this.adjList = new HashMap<>();
        // すべての頂点と辺を追加する
        for (Vertex[] edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 頂点数を取得する */
    public int size() {
        return adjList.size();
    }

    /* 辺を追加する */
    public void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // 辺 vet1 - vet2 を追加する
        adjList.get(vet1).add(vet2);
        adjList.get(vet2).add(vet1);
    }

    /* 辺を削除する */
    public void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // 辺 vet1 - vet2 を削除する
        adjList.get(vet1).remove(vet2);
        adjList.get(vet2).remove(vet1);
    }

    /* 頂点を追加する */
    public void addVertex(Vertex vet) {
        if (adjList.containsKey(vet))
            return;
        // 隣接リストに新しい連結リストを追加する
        adjList.put(vet, new ArrayList<>());
    }

    /* 頂点を削除する */
    public void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet))
            throw new IllegalArgumentException();
        // 隣接リストから頂点 vet に対応する連結リストを削除する
        adjList.remove(vet);
        // 他の頂点の連結リストを走査し、vet を含むすべての辺を削除する
        for (List<Vertex> list : adjList.values()) {
            list.remove(vet);
        }
    }

    /* 隣接リストを表示する */
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
        /* 無向グラフを初期化する */
        Vertex[] v = Vertex.valsToVets(new int[] { 1, 3, 2, 5, 4 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[3] }, { v[2], v[4] }, { v[3], v[4] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初期化後のグラフ");
        graph.print();

        /* 辺を追加する */
        // 頂点 1, 2 は v[0], v[2] に対応する
        graph.addEdge(v[0], v[2]);
        System.out.println("\n辺 1-2 を追加した後のグラフ");
        graph.print();

        /* 辺を削除する */
        // 頂点 1, 3 は v[0], v[1] に対応する
        graph.removeEdge(v[0], v[1]);
        System.out.println("\n辺 1-3 を削除した後のグラフ");
        graph.print();

        /* 頂点を追加する */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        System.out.println("\n頂点 6 を追加した後のグラフ");
        graph.print();

        /* 頂点を削除する */
        // 頂点 3 は v[1] に対応する
        graph.removeVertex(v[1]);
        System.out.println("\n頂点 3 を削除した後のグラフ");
        graph.print();
    }
}
