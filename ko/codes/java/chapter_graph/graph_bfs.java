/**
 * File: graph_bfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_bfs {
    /* 너비 우선 순회 */
    // 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 정점 순회 순서
        List<Vertex> res = new ArrayList<>();
        // 방문한 정점을 기록하는 해시 집합
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // 큐를 사용하여 BFS를 구현한다
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // 정점 vet에서 시작하여 모든 정점을 방문할 때까지 반복한다
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // 큐 맨 앞의 정점을 꺼낸다
            res.add(vet);            // 방문한 정점을 기록한다
            // 해당 정점의 모든 인접 정점을 순회한다
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // 이미 방문한 정점은 건너뛴다
                que.offer(adjVet);   // 방문하지 않은 정점만 큐에 삽입한다
                visited.add(adjVet); // 해당 정점을 방문했다고 표시한다
            }
        }
        // 정점 순회 순서를 반환한다
        return res;
    }

    public static void main(String[] args) {
        /* 무방향 그래프 초기화 */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] },
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n초기화한 후의 그래프");
        graph.print();

        /* 너비 우선 순회 */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\n너비 우선 순회(BFS)의 정점 순서");
        System.out.println(Vertex.vetsToVals(res));
    }
}
