/**
 * File: graph_bfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_bfs {
    /* 廣度優先走訪 */
    // 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂點走訪序列
        List<Vertex> res = new ArrayList<>();
        // 雜湊集合，用於記錄已被訪問過的頂點
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // 佇列用於實現 BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // 以頂點 vet 為起點，迴圈直至訪問完所有頂點
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // 佇列首頂點出隊
            res.add(vet);            // 記錄訪問頂點
            // 走訪該頂點的所有鄰接頂點
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // 跳過已被訪問的頂點
                que.offer(adjVet);   // 只入列未訪問的頂點
                visited.add(adjVet); // 標記該頂點已被訪問
            }
        }
        // 返回頂點走訪序列
        return res;
    }

    public static void main(String[] args) {
        /* 初始化無向圖 */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] },
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初始化後，圖為");
        graph.print();

        /* 廣度優先走訪 */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\n廣度優先走訪（BFS）頂點序列為");
        System.out.println(Vertex.vetsToVals(res));
    }
}
