/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* 廣度優先走訪 */
    // 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // 頂點走訪順序
        List<Vertex> res = [];
        // 用雜湊集合記錄已走訪的頂點
        HashSet<Vertex> visited = [startVet];
        // 使用佇列實作 BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // 從頂點 vet 出發，反覆執行，直到走訪完所有頂點
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // 取出佇列前端的頂點
            res.Add(vet);               // 記錄走訪的頂點
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // 略過已走訪的頂點
                }
                que.Enqueue(adjVet);   // 只將尚未走訪的頂點加入佇列
                visited.Add(adjVet);   // 將此頂點標記為已走訪
            }
        }

        // 回傳頂點的走訪順序
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
        Console.WriteLine("\n初始化後的圖為");
        graph.Print();

        /* 廣度優先走訪 */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\n廣度優先走訪（BFS）的頂點順序為");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
