/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* 深度優先走訪的輔助函式 */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // 記錄走訪的頂點
        visited.Add(vet); // 將此頂點標記為已走訪
        // 走訪此頂點的所有相鄰頂點
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // 略過已走訪的頂點                             
            }
            // 遞迴走訪相鄰頂點
            DFS(graph, visited, res, adjVet);
        }
    }

    /* 深度優先走訪 */
    // 以鄰接串列表示圖，以便取得指定頂點的所有相鄰頂點
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // 頂點走訪順序
        List<Vertex> res = [];
        // 用雜湊集合記錄已走訪的頂點
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
        Console.WriteLine("\n初始化後的圖為");
        graph.Print();

        /* 深度優先走訪 */
        List<Vertex> res = GraphDFS(graph, v[0]);
        Console.WriteLine("\n深度優先走訪（DFS）的頂點順序為");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
