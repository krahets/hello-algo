/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* 广度优先遍历 */
    // 使用邻接表来表示图，以便获取指定顶点的所有邻接顶点
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // 顶点遍历序列
        List<Vertex> res = [];
        // 哈希表，用于记录已被访问过的顶点
        HashSet<Vertex> visited = [startVet];
        // 队列用于实现 BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // 以顶点 vet 为起点，循环直至访问完所有顶点
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // 队首顶点出队
            res.Add(vet);               // 记录访问顶点
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // 跳过已被访问的顶点
                }
                que.Enqueue(adjVet);   // 只入队未访问的顶点
                visited.Add(adjVet);   // 标记该顶点已被访问
            }
        }

        // 返回顶点遍历序列
        return res;
    }

    [Test]
    public void Test() {
        /* 初始化无向图 */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[1], v[4]], [v[2], v[5]], [v[3], v[4]],
            [v[3], v[6]], [v[4], v[5]], [v[4], v[7]],
            [v[5], v[8]], [v[6], v[7]], [v[7], v[8]]
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\n初始化后，图为");
        graph.Print();

        /* 广度优先遍历 */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\n广度优先遍历（BFS）顶点序列为");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
