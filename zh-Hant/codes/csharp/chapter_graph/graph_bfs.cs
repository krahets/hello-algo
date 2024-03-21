/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* 廣度優先走訪 */
    // 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂點走訪序列
        List<Vertex> res = [];
        // 雜湊表，用於記錄已被訪問過的頂點
        HashSet<Vertex> visited = [startVet];
        // 佇列用於實現 BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // 以頂點 vet 為起點，迴圈直至訪問完所有頂點
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // 佇列首頂點出隊
            res.Add(vet);               // 記錄訪問頂點
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // 跳過已被訪問的頂點
                }
                que.Enqueue(adjVet);   // 只入列未訪問的頂點
                visited.Add(adjVet);   // 標記該頂點已被訪問
            }
        }

        // 返回頂點走訪序列
        return res;
    }

    [Test]
    public void Test() {
        /* 初始化無向圖 */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[1], v[4]], [v[2], v[5]], [v[3], v[4]],
            [v[3], v[6]], [v[4], v[5]], [v[4], v[7]],
            [v[5], v[8]], [v[6], v[7]], [v[7], v[8]]
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\n初始化後，圖為");
        graph.Print();

        /* 廣度優先走訪 */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\n廣度優先走訪（BFS）頂點序列為");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
