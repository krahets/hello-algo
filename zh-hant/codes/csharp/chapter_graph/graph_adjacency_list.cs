/**
 * File: graph_adjacency_list.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* 以鄰接串列實作的無向圖類別 */
public class GraphAdjList {
    // 鄰接串列，key 是頂點，value 是該頂點的所有相鄰頂點
    public Dictionary<Vertex, List<Vertex>> adjList;

    /* 建構函式 */
    public GraphAdjList(Vertex[][] edges) {
        adjList = [];
        // 加入所有頂點和邊
        foreach (Vertex[] edge in edges) {
            AddVertex(edge[0]);
            AddVertex(edge[1]);
            AddEdge(edge[0], edge[1]);
        }
    }

    /* 取得頂點數量 */
    int Size() {
        return adjList.Count;
    }

    /* 新增邊 */
    public void AddEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 新增邊 vet1 - vet2
        adjList[vet1].Add(vet2);
        adjList[vet2].Add(vet1);
    }

    /* 刪除邊 */
    public void RemoveEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 刪除邊 vet1 - vet2
        adjList[vet1].Remove(vet2);
        adjList[vet2].Remove(vet1);
    }

    /* 新增頂點 */
    public void AddVertex(Vertex vet) {
        if (adjList.ContainsKey(vet))
            return;
        // 在鄰接串列中新增一條鏈結串列
        adjList.Add(vet, []);
    }

    /* 刪除頂點 */
    public void RemoveVertex(Vertex vet) {
        if (!adjList.ContainsKey(vet))
            throw new InvalidOperationException();
        // 從鄰接串列中刪除頂點 vet 對應的鏈結串列
        adjList.Remove(vet);
        // 走訪其他頂點的鏈結串列，刪除所有以 vet 為端點的邊
        foreach (List<Vertex> list in adjList.Values) {
            list.Remove(vet);
        }
    }

    /* 印出鄰接串列 */
    public void Print() {
        Console.WriteLine("鄰接串列 =");
        foreach (KeyValuePair<Vertex, List<Vertex>> pair in adjList) {
            List<int> tmp = [];
            foreach (Vertex vertex in pair.Value)
                tmp.Add(vertex.val);
            Console.WriteLine(pair.Key.val + ": [" + string.Join(", ", tmp) + "],");
        }
    }
}

public class graph_adjacency_list {
    [Test]
    public void Test() {
        /* 初始化無向圖 */
        Vertex[] v = Vertex.ValsToVets([1, 3, 2, 5, 4]);
        Vertex[][] edges =
        [
            [v[0], v[1]],
            [v[0], v[3]],
            [v[1], v[2]],
            [v[2], v[3]],
            [v[2], v[4]],
            [v[3], v[4]] 
        ];
        GraphAdjList graph = new(edges);
        Console.WriteLine("\n初始化後的圖為");
        graph.Print();

        /* 新增邊 */
        // 頂點 1、2 分別是 v[0]、v[2]
        graph.AddEdge(v[0], v[2]);
        Console.WriteLine("\n新增邊 1-2 後的圖為");
        graph.Print();

        /* 刪除邊 */
        // 頂點 1、3 分別是 v[0]、v[1]
        graph.RemoveEdge(v[0], v[1]);
        Console.WriteLine("\n刪除邊 1-3 後的圖為");
        graph.Print();

        /* 新增頂點 */
        Vertex v5 = new(6);
        graph.AddVertex(v5);
        Console.WriteLine("\n新增頂點 6 後的圖為");
        graph.Print();

        /* 刪除頂點 */
        // 頂點 3 是 v[1]
        graph.RemoveVertex(v[1]);
        Console.WriteLine("\n刪除頂點 3 後的圖為");
        graph.Print();
    }
}
