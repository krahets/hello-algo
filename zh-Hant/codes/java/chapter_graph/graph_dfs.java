/**
 * File: graph_dfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_dfs {
    /* 深度優先走訪輔助函式 */
    static void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // 記錄訪問頂點
        visited.add(vet); // 標記該頂點已被訪問
        // 走訪該頂點的所有鄰接頂點
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // 跳過已被訪問的頂點
            // 遞迴訪問鄰接頂點
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度優先走訪 */
    // 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
    static List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂點走訪序列
        List<Vertex> res = new ArrayList<>();
        // 雜湊表，用於記錄已被訪問過的頂點
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
        System.out.println("\n初始化後，圖為");
        graph.print();

        /* 深度優先走訪 */
        List<Vertex> res = graphDFS(graph, v[0]);
        System.out.println("\n深度優先走訪（DFS）頂點序列為");
        System.out.println(Vertex.vetsToVals(res));
    }
}
