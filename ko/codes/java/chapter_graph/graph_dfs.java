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
        res.add(vet);     // 방문한 정점을 기록한다
        visited.add(vet); // 해당 정점을 방문했다고 표시한다
        // 해당 정점의 모든 인접 정점을 순회한다
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // 이미 방문한 정점은 건너뛴다
            // 인접 정점을 재귀적으로 방문한다
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 깊이 우선 순회 */
    // 지정한 정점의 모든 인접 정점을 얻기 쉽도록 그래프를 인접 리스트로 표현한다
    static List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // 정점 순회 순서
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
        System.out.println("\n초기화한 후의 그래프");
        graph.print();

        /* 깊이 우선 순회 */
        List<Vertex> res = graphDFS(graph, v[0]);
        System.out.println("\n깊이 우선 순회(DFS)의 정점 순서");
        System.out.println(Vertex.vetsToVals(res));
    }
}
