/**
 * File: graph_dfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_dfs {
    /* 深さ優先走査の補助関数 */
    static void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // 訪問した頂点を記録する
        visited.add(vet); // この頂点を訪問済みにする
        // この頂点に隣接する全頂点を走査する
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // 訪問済みの頂点をスキップする
            // 隣接する頂点を再帰的に訪問する
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深さ優先走査 */
    // 指定した頂点に隣接する全頂点を取得しやすいように、グラフを隣接リストで表す
    static List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂点の走査順序
        List<Vertex> res = new ArrayList<>();
        // 訪問済みの頂点を記録するハッシュ集合
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }

    public static void main(String[] args) {
        /* 無向グラフを初期化する */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[5] }, { v[4], v[5] }, { v[5], v[6] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初期化後のグラフ");
        graph.print();

        /* 深さ優先走査 */
        List<Vertex> res = graphDFS(graph, v[0]);
        System.out.println("\n深さ優先走査（DFS）の頂点の順序");
        System.out.println(Vertex.vetsToVals(res));
    }
}
