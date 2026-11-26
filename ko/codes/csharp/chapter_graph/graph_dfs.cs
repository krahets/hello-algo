/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* 깊이 우선 순회 보조 함수 */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // 방문한 정점 기록
        visited.Add(vet); // 이 정점을 방문한 것으로 표시
        // 현재 정점에 인접한 모든 정점 순회
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // 이미 방문한 정점은 건너뜀                             
            }
            // 인접 정점을 재귀적으로 방문
            DFS(graph, visited, res, adjVet);
        }
    }

    /* 깊이 우선 순회 */
    // 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // 정점 방문 순서
        List<Vertex> res = [];
        // 방문한 정점을 기록하는 해시 집합
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }

    [Test]
    public void Test() {
        /* 무방향 그래프 초기화 */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\n초기화한 그래프:");
        graph.Print();

        /* 깊이 우선 순회 */
        List<Vertex> res = GraphDFS(graph, v[0]);
        Console.WriteLine("\n깊이 우선 순회(DFS)의 정점 방문 순서:");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
