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
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = new ArrayList<>();
        // 訪問済みの頂点を記録するハッシュ集合
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // BFS の実装にキューを使う
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // 頂点 vet を始点として、すべての頂点を訪問するまで繰り返す
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // キューの先頭の頂点をデキューする
            res.add(vet);            // 訪問した頂点を記録する
            // この頂点に隣接する全頂点を走査する
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // 訪問済みの頂点をスキップする
                que.offer(adjVet);   // 未訪問の頂点だけをエンキューする
                visited.add(adjVet); // この頂点を訪問済みにする
            }
        }
        // 頂点の走査順序を返す
        return res;
    }

    public static void main(String[] args) {
        /* 無向グラフを初期化する */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] },
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初期化後のグラフ");
        graph.print();

        /* 幅優先走査 */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\n幅優先走査（BFS）の頂点の順序");
        System.out.println(Vertex.vetsToVals(res));
    }
}
