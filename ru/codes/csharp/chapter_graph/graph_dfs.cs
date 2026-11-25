/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* Вспомогательная функция обхода в глубину */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // Записать посещённую вершину
        visited.Add(vet); // Отметить вершину как посещённую
        // Перебрать всех соседей этой вершины
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // Пропустить посещённые вершины                             
            }
            // Рекурсивно посетить соседнюю вершину
            DFS(graph, visited, res, adjVet);
        }
    }

    /* Обход в глубину */
    // Список смежности позволяет получить всех соседей заданной вершины
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // Порядок обхода вершин
        List<Vertex> res = [];
        // Хеш-множество посещённых вершин
        HashSet<Vertex> visited = [];
        DFS(graph, visited, res, startVet);
        return res;
    }

    [Test]
    public void Test() {
        /* Инициализировать неориентированный граф */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[2], v[5]], [v[4], v[5]], [v[5], v[6]],
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\nГраф после инициализации:");
        graph.Print();

        /* Обход в глубину */
        List<Vertex> res = GraphDFS(graph, v[0]);
        Console.WriteLine("\nПорядок обхода вершин в глубину (DFS):");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
