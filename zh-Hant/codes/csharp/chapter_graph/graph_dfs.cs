/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* 深度優先走訪輔助函式 */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // 記錄訪問頂點
        visited.Add(vet); // 標記該頂點已被訪問
        // 走訪該頂點的所有鄰接頂點
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // 跳過已被訪問的頂點                             
            }
            // 遞迴訪問鄰接頂點
            DFS(graph, visited, res, adjVet);
        }
    }

    /* 深度優先走訪 */
    // 使用鄰接表來表示圖，以便獲取指定頂點的所有鄰接頂點
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂點走訪序列
        List<Vertex> res = [];
        // 雜湊表，用於記錄已被訪問過的頂點
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }

    [Test]
    public void Test() {
        /* 初始化無向圖 */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\n初始化後，圖為");
        graph.Print();

        /* 深度優先走訪 */
        List<Vertex> res = GraphDFS(graph, v[0]);
        Console.WriteLine("\n深度優先走訪（DFS）頂點序列為");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
