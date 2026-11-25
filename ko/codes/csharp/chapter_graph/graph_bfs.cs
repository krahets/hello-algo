/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* 너비 우선 순회 */
    // 지정한 정점의 인접 정점을 모두 구할 수 있도록 인접 리스트로 그래프 표현
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // 정점 방문 순서
        List<Vertex> res = [];
        // 방문한 정점을 기록하는 해시 집합
        HashSet<Vertex> visited = [startVet];
        // BFS 구현에 사용하는 큐
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // 정점 vet에서 시작해 모든 정점을 방문할 때까지 반복
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // 큐의 맨 앞 정점을 꺼냄
            res.Add(vet);               // 방문한 정점 기록
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // 이미 방문한 정점은 건너뜀
                }
                que.Enqueue(adjVet);   // 아직 방문하지 않은 정점만 큐에 삽입
                visited.Add(adjVet);   // 이 정점을 방문한 것으로 표시
            }
        }

        // 정점 방문 순서 반환
        return res;
    }

    [Test]
    public void Test() {
        /* 무방향 그래프 초기화 */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[1], v[4]], [v[2], v[5]], [v[3], v[4]],
            [v[3], v[6]], [v[4], v[5]], [v[4], v[7]],
            [v[5], v[8]], [v[6], v[7]], [v[7], v[8]]
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\n초기화한 그래프:");
        graph.Print();

        /* 너비 우선 순회 */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\n너비 우선 순회(BFS)의 정점 방문 순서:");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
