/**
 * File: graph_adjacency_list.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* Класс неориентированного графа на основе списка смежности */
public class GraphAdjList {
    // Список смежности, key: вершина, value: все смежные с ней вершины
    public Dictionary<Vertex, List<Vertex>> adjList;

    /* Конструктор */
    public GraphAdjList(Vertex[][] edges) {
        adjList = [];
        // Добавить все вершины и ребра
        foreach (Vertex[] edge in edges) {
            AddVertex(edge[0]);
            AddVertex(edge[1]);
            AddEdge(edge[0], edge[1]);
        }
    }

    /* Получить количество вершин */
    int Size() {
        return adjList.Count;
    }

    /* Добавить ребро */
    public void AddEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // Добавить ребро vet1 - vet2
        adjList[vet1].Add(vet2);
        adjList[vet2].Add(vet1);
    }

    /* Удалить ребро */
    public void RemoveEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.ContainsKey(vet1) || !adjList.ContainsKey(vet2) || vet1 == vet2)
            throw new InvalidOperationException();
        // Удалить ребро vet1 - vet2
        adjList[vet1].Remove(vet2);
        adjList[vet2].Remove(vet1);
    }

    /* Добавить вершину */
    public void AddVertex(Vertex vet) {
        if (adjList.ContainsKey(vet))
            return;
        // Добавить новый связный список в список смежности
        adjList.Add(vet, []);
    }

    /* Удалить вершину */
    public void RemoveVertex(Vertex vet) {
        if (!adjList.ContainsKey(vet))
            throw new InvalidOperationException();
        // Удалить из списка смежности связный список, соответствующий вершине vet
        adjList.Remove(vet);
        // Обойти списки других вершин и удалить все ребра, содержащие vet
        foreach (List<Vertex> list in adjList.Values) {
            list.Remove(vet);
        }
    }

    /* Вывести список смежности */
    public void Print() {
        Console.WriteLine("Список смежности =");
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
        /* Инициализировать неориентированный граф */
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
        Console.WriteLine("\nПосле инициализации граф имеет вид");
        graph.Print();

        /* Добавить ребро */
        // Вершины 1 и 2, то есть v[0] и v[2]
        graph.AddEdge(v[0], v[2]);
        Console.WriteLine("\nПосле добавления ребра 1-2 граф имеет вид");
        graph.Print();

        /* Удалить ребро */
        // Вершины 1 и 3, то есть v[0] и v[1]
        graph.RemoveEdge(v[0], v[1]);
        Console.WriteLine("\nПосле удаления ребра 1-3 граф имеет вид");
        graph.Print();

        /* Добавить вершину */
        Vertex v5 = new(6);
        graph.AddVertex(v5);
        Console.WriteLine("\nПосле добавления вершины 6 граф имеет вид");
        graph.Print();

        /* Удалить вершину */
        // Вершина 3, то есть v[1]
        graph.RemoveVertex(v[1]);
        Console.WriteLine("\nПосле удаления вершины 3 граф имеет вид");
        graph.Print();
    }
}
