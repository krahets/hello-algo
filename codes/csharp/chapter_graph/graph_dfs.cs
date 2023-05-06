/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* 深度优先遍历 DFS 辅助函数 */
    public void dfs(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // 记录访问顶点
        visited.Add(vet); // 标记该顶点已被访问
        // 遍历该顶点的所有邻接顶点
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // 跳过已被访问过的顶点                             
            }
            // 递归访问邻接顶点
            dfs(graph, visited, res, adjVet);
        }
    }

    /* 深度优先遍历 DFS */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    public List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // 顶点遍历序列
        List<Vertex> res = new List<Vertex>();
        // 哈希表，用于记录已被访问过的顶点
        HashSet<Vertex> visited = new HashSet<Vertex>();
        dfs(graph, visited, res, startVet);
        return res;
    }

    [Test]
    public void Test() {
        /* 初始化无向图 */
        Vertex[] v = Vertex.ValsToVets(new int[7] { 0, 1, 2, 3, 4, 5, 6 });
        Vertex[][] edges = new Vertex[6][]
        {
            new Vertex[2] { v[0], v[1] }, new Vertex[2] { v[0], v[3] }, new Vertex[2] { v[1], v[2] },
            new Vertex[2] { v[2], v[5] }, new Vertex[2] { v[4], v[5] }, new Vertex[2] { v[5], v[6] },
        };

        GraphAdjList graph = new GraphAdjList(edges);
        Console.WriteLine("\n初始化后，图为");
        graph.print();

        /* 深度优先遍历 DFS */
        List<Vertex> res = graphDFS(graph, v[0]);
        Console.WriteLine("\n深度优先遍历（DFS）顶点序列为");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
