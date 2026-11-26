/**
 * File: graph_dfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_dfs {
    /* 深度優先走訪的輔助函式 */
    static void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // 記錄走訪的頂點
        visited.add(vet); // 將此頂點標記為已走訪
        // 走訪此頂點的所有相鄰頂點
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // 略過已走訪的頂點
            // 遞迴走訪相鄰頂點
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度優先走訪 */
    // 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
    static List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂點走訪順序
        List<Vertex> res = new ArrayList<>();
        // 用雜湊集合記錄已走訪的頂點
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }

    public static void main(String[] args) {
        /* 初始化無向圖 */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[5] }, { v[4], v[5] }, { v[5], v[6] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初始化後的圖為");
        graph.print();

        /* 深度優先走訪 */
        List<Vertex> res = graphDFS(graph, v[0]);
        System.out.println("\n深度優先走訪（DFS）的頂點順序為");
        System.out.println(Vertex.vetsToVals(res));
    }
}
