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
    // 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂點走訪順序
        List<Vertex> res = new ArrayList<>();
        // 用雜湊集合記錄已走訪的頂點
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // 使用佇列實作 BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // 取出佇列前端的頂點
            res.add(vet);            // 記錄走訪的頂點
            // 走訪此頂點的所有相鄰頂點
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // 略過已走訪的頂點
                que.offer(adjVet);   // 只將尚未走訪的頂點加入佇列
                visited.add(adjVet); // 將此頂點標記為已走訪
            }
        }
        // 回傳頂點的走訪順序
        return res;
    }

    public static void main(String[] args) {
        /* 初始化無向圖 */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] },
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n初始化後的圖為");
        graph.print();

        /* 廣度優先走訪 */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\n廣度優先走訪（BFS）的頂點順序為");
        System.out.println(Vertex.vetsToVals(res));
    }
}
