/**
 * File: graph_adjacency_list.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* 基于邻接表实现的无向图类 */
public class GraphAdjList {
    // 邻接表，key: 顶点，value：该顶点的所有邻接顶点
    public Dictionary<Vertex, List<Vertex>> adjList;

    /* 构造函数 */
    public GraphAdjList(Vertex[][] edges) {
        this.adjList = new Dictionary<Vertex, List<Vertex>>();
        // 添加所有顶点和边
        foreach (Vertex[] edge in edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 获取顶点数量 */
    public int size() {
        return adjList.Count;
    }

    /* 添加边 */
    public void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 添加边 vet1 - vet2
        adjList[vet1].Add(vet2);
        adjList[vet2].Add(vet1);
    }

    /* 删除边 */
    public void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 删除边 vet1 - vet2
        adjList[vet1].Remove(vet2);
        adjList[vet2].Remove(vet1);
    }

    /* 添加顶点 */
    public void addVertex(Vertex vet) {
        if (adjList.ContainsKey(vet))
            return;
        // 在邻接表中添加一个新链表
        adjList.Add(vet, new List<Vertex>());
    }

    /* 删除顶点 */
    public void removeVertex(Vertex vet) {
        if (!adjList.ContainsKey(vet))
            throw new InvalidOperationException();
        // 在邻接表中删除顶点 vet 对应的链表
        adjList.Remove(vet);
        // 遍历其他顶点的链表，删除所有包含 vet 的边
        foreach (List<Vertex> list in adjList.Values) {
            list.Remove(vet);
        }
    }

    /* 打印邻接表 */
    public void print() {
        Console.WriteLine("邻接表 =");
        foreach (KeyValuePair<Vertex, List<Vertex>> pair in adjList) {
            List<int> tmp = new List<int>();
            foreach (Vertex vertex in pair.Value)
                tmp.Add(vertex.val);
            Console.WriteLine(pair.Key.val + ": [" + string.Join(", ", tmp) + "],");
        }
    }
}

public class graph_adjacency_list {
    [Test]
    public void Test() {
        /* 初始化无向图 */
        Vertex[] v = Vertex.ValsToVets(new int[] { 1, 3, 2, 5, 4 });
        Vertex[][] edges = new Vertex[][] { new Vertex[] { v[0], v[1] }, new Vertex[] { v[0], v[3] },
                                            new Vertex[] { v[1], v[2] }, new Vertex[] { v[2], v[3] },
                                            new Vertex[] { v[2], v[4] }, new Vertex[] { v[3], v[4] } };
        GraphAdjList graph = new GraphAdjList(edges);
        Console.WriteLine("\n初始化后，图为");
        graph.print();

        /* 添加边 */
        // 顶点 1, 2 即 v[0], v[2]
        graph.addEdge(v[0], v[2]);
        Console.WriteLine("\n添加边 1-2 后，图为");
        graph.print();

        /* 删除边 */
        // 顶点 1, 3 即 v[0], v[1]
        graph.removeEdge(v[0], v[1]);
        Console.WriteLine("\n删除边 1-3 后，图为");
        graph.print();

        /* 添加顶点 */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        Console.WriteLine("\n添加顶点 6 后，图为");
        graph.print();

        /* 删除顶点 */
        // 顶点 3 即 v[1]
        graph.removeVertex(v[1]);
        Console.WriteLine("\n删除顶点 3 后，图为");
        graph.print();
    }
}
