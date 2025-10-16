/**
 * File: graph_bfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_bfs {
    /* 幅優先走査 */
    // 隣接リストを使用してグラフを表現し、指定した頂点のすべての隣接頂点を取得
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂点走査順序
        List<Vertex> res = new ArrayList<>();
        // ハッシュセット、訪問済みの頂点を記録するために使用
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // BFS を実装するために使用するキュー
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // 頂点 vet から開始し、すべての頂点が訪問されるまでループ
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // キューの先頭の頂点をデキュー
            res.add(vet);            // 訪問した頂点を記録
            // その頂点のすべての隣接頂点を走査
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // すでに訪問済みの頂点をスキップ
                que.offer(adjVet);   // 未訪問の頂点のみをエンキュー
                visited.add(adjVet); // 頂点を訪問済みとしてマーク
            }
        }
        // 頂点走査順序を返す
        return res;
    }

    public static void main(String[] args) {
        /* 無向グラフを初期化 */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] },
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初期化後、グラフは");
        graph.print();

        /* 幅優先走査 */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\n幅優先走査 (BFS) の頂点順序は");
        System.out.println(Vertex.vetsToVals(res));
    }
}