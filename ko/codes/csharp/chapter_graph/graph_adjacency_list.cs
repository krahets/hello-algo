/**
 * File: graph_adjacency_list.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* 인접 리스트로 구현한 무방향 그래프 클래스 */
public class GraphAdjList {
    // 인접 리스트의 key: 정점, value: 해당 정점의 모든 인접 정점
    public Dictionary<Vertex, List<Vertex>> adjList;

    /* 생성자 */
    public GraphAdjList(Vertex[][] edges) {
        adjList = [];
        // 모든 정점과 간선을 추가한다
        foreach (Vertex[] edge in edges) {
            AddVertex(edge[0]);
            AddVertex(edge[1]);
            AddEdge(edge[0], edge[1]);
        }
    }

    /* 정점 개수 반환 */
    int Size() {
        return adjList.Count;
    }

    /* 간선 추가 */
    public void AddEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 간선 vet1 - vet2를 추가한다
        adjList[vet1].Add(vet2);
        adjList[vet2].Add(vet1);
    }

    /* 간선 삭제 */
    public void RemoveEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // 간선 vet1 - vet2를 삭제한다
        adjList[vet1].Remove(vet2);
        adjList[vet2].Remove(vet1);
    }

    /* 정점 추가 */
    public void AddVertex(Vertex vet) {
        if (adjList.ContainsKey(vet))
            return;
        // 인접 리스트에 새 연결 리스트를 추가한다
        adjList.Add(vet, []);
    }

    /* 정점 삭제 */
    public void RemoveVertex(Vertex vet) {
        if (!adjList.ContainsKey(vet))
            throw new InvalidOperationException();
        // 인접 리스트에서 정점 vet에 해당하는 연결 리스트를 삭제한다
        adjList.Remove(vet);
        // 다른 정점의 연결 리스트를 순회하여 vet를 포함하는 모든 간선을 삭제한다
        foreach (List<Vertex> list in adjList.Values) {
            list.Remove(vet);
        }
    }

    /* 인접 리스트 출력 */
    public void Print() {
        Console.WriteLine("인접 리스트 =");
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
        /* 무방향 그래프 초기화 */
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
        Console.WriteLine("\n초기화한 후의 그래프");
        graph.Print();

        /* 간선 추가 */
        // 정점 1, 2는 각각 v[0], v[2]이다
        graph.AddEdge(v[0], v[2]);
        Console.WriteLine("\n간선 1-2를 추가한 후의 그래프");
        graph.Print();

        /* 간선 삭제 */
        // 정점 1, 3은 각각 v[0], v[1]이다
        graph.RemoveEdge(v[0], v[1]);
        Console.WriteLine("\n간선 1-3을 삭제한 후의 그래프");
        graph.Print();

        /* 정점 추가 */
        Vertex v5 = new(6);
        graph.AddVertex(v5);
        Console.WriteLine("\n정점 6을 추가한 후의 그래프");
        graph.Print();

        /* 정점 삭제 */
        // 정점 3은 v[1]이다
        graph.RemoveVertex(v[1]);
        Console.WriteLine("\n정점 3을 삭제한 후의 그래프");
        graph.Print();
    }
}
