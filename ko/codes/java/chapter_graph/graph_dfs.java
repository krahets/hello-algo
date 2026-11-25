/**
 * File: graph_dfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_dfs {
    /* 깊이 우선 순회 보조 함수 */
    static void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // 방문한 정점 기록
        visited.add(vet); // 이 정점을 방문한 것으로 표시
        // 현재 정점에 인접한 모든 정점 순회
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // 이미 방문한 정점은 건너뜀
            // 인접 정점을 재귀적으로 방문
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 깊이 우선 순회 */
    // 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
    static List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // 정점 방문 순서
        List<Vertex> res = new ArrayList<>();
        // 방문한 정점을 기록하는 해시 집합
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }

    public static void main(String[] args) {
        /* 무방향 그래프 초기화 */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[5] }, { v[4], v[5] }, { v[5], v[6] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\n초기화한 그래프:");
        graph.print();

        /* 깊이 우선 순회 */
        List<Vertex> res = graphDFS(graph, v[0]);
        System.out.println("\n깊이 우선 순회(DFS)의 정점 방문 순서:");
        System.out.println(Vertex.vetsToVals(res));
    }
}
