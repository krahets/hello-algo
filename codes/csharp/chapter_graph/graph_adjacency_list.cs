/**
 * File: graph_adjacency_list.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

using NUnit.Framework;

namespace hello_algo.chapter_graph;

/* 顶点类 */
class Vertex
{
    public int Val { get; init; }
    public Vertex(int val)
    {
        Val = val;
    }
}

/* 基于邻接表实现的无向图类 */
class GraphAdjList
{
    // 请注意，vertices 和 adjList 中存储的都是 Vertex 对象
    Dictionary<Vertex, HashSet<Vertex>> adjList; // 邻接表（使用哈希表实现）

    /* 构造函数 */
    public GraphAdjList(Vertex[][] edges)
    {
        this.adjList = new Dictionary<Vertex, HashSet<Vertex>>();
        // 添加所有顶点和边
        foreach (Vertex[] edge in edges)
        {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* 获取顶点数量 */
    public int size()
    {
        return adjList.Count;
    }

    /* 添加边 */
    public void addEdge(Vertex vet1, Vertex vet2)
    {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 添加边 vet1 - vet2
        adjList[vet1].Add(vet2);
        adjList[vet2].Add(vet1);
    }

    /* 删除边 */
    public void removeEdge(Vertex vet1, Vertex vet2)
    {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 删除边 vet1 - vet2
        adjList[vet1].Remove(vet2);
        adjList[vet2].Remove(vet1);
    }

    /* 添加顶点 */
    public void addVertex(Vertex vet)
    {
        if (adjList.ContainsKey(vet))
            return;
        // 在邻接表中添加一个新链表（即 HashSet）
        adjList.Add(vet, new HashSet<Vertex>());
    }

    /* 删除顶点 */
    public void removeVertex(Vertex vet)
    {
        if (!adjList.ContainsKey(vet))
            throw new InvalidOperationException();
        // 在邻接表中删除顶点 vet 对应的链表（即 HashSet）
        adjList.Remove(vet);
        // 遍历其它顶点的链表（即 HashSet），删除所有包含 vet 的边
        foreach (HashSet<Vertex> set in adjList.Values)
        {
            set.Remove(vet);
        }
    }

    /* 打印邻接表 */
    public void print()
    {
        Console.WriteLine("邻接表 =");
        foreach (KeyValuePair<Vertex, HashSet<Vertex>> entry in adjList)
        {
            List<int> tmp = new List<int>();
            foreach (Vertex vertex in entry.Value)
                tmp.Add(vertex.Val);
            Console.WriteLine(entry.Key.Val + ": " + string.Join(' ', tmp) + ",");
        }
    }
}

public class graph_adjacency_list
{
    [Test]
    public void Test()
    {
        /* 初始化无向图 */
        Vertex v0 = new Vertex(1),
               v1 = new Vertex(3),
               v2 = new Vertex(2),
               v3 = new Vertex(5),
               v4 = new Vertex(4);
        Vertex[][] edges = new Vertex[][] { new Vertex[] { v0, v1 }, new Vertex[] { v1, v2 }, new Vertex[] { v2, v3 }, new Vertex[] { v0, v3 }, new Vertex[] { v2, v4 }, new Vertex[] { v3, v4 } };
        GraphAdjList graph = new GraphAdjList(edges);
        Console.WriteLine("\n初始化后，图为");
        graph.print();

        /* 添加边 */
        // 顶点 1, 2 即 v0, v2
        graph.addEdge(v0, v2);
        Console.WriteLine("\n添加边 1-2 后，图为");
        graph.print();

        /* 删除边 */
        // 顶点 1, 3 即 v0, v1
        graph.removeEdge(v0, v1);
        Console.WriteLine("\n删除边 1-3 后，图为");
        graph.print();

        /* 添加顶点 */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        Console.WriteLine("\n添加顶点 6 后，图为");
        graph.print();

        /* 删除顶点 */
        // 顶点 3 即 v1
        graph.removeVertex(v1);
        Console.WriteLine("\n删除顶点 3 后，图为");
        graph.print();
    }
}
