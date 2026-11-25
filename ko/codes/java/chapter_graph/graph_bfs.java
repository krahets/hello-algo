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
    // 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // 정점 방문 순서
        List<Vertex> res = new ArrayList<>();
        // 방문한 정점을 기록하는 해시 집합
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // BFS 구현에 사용하는 큐
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // 정점 vet에서 시작해 모든 정점을 방문할 때까지 반복
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // 큐의 맨 앞 정점을 꺼냄
            res.add(vet);            // 방문한 정점 기록
            // 현재 정점에 인접한 모든 정점 순회
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // 이미 방문한 정점은 건너뜀
                que.offer(adjVet);   // 아직 방문하지 않은 정점만 큐에 삽입
                visited.add(adjVet); // 이 정점을 방문한 것으로 표시
            }
        }
        // 정점 방문 순서 반환
        return res;
    }

    public static void main(String[] args) {
        /* 무방향 그래프 초기화 */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] },
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n초기화한 그래프:");
        graph.print();

        /* 너비 우선 순회 */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\n너비 우선 순회(BFS)의 정점 방문 순서:");
        System.out.println(Vertex.vetsToVals(res));
    }
}
