/**
 * File: graph_dfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_dfs {
    /* обход в глубинувспомогательная функция */
    void DFS(GraphAdjList graph, HashSet<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.Add(vet);     // Записать посещенную вершину
        visited.Add(vet); // Пометить эту вершину как посещенную
        // Обойти все смежные вершины этой вершины
        foreach (Vertex adjVet in graph.adjList[vet]) {
            if (visited.Contains(adjVet)) {
                continue; // Пропустить уже посещенную вершину
            }
            // Рекурсивно посетить смежные вершины
            DFS(graph, visited, res, adjVet);
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получать все соседние вершины заданной вершины
    List<Vertex> GraphDFS(GraphAdjList graph, Vertex startVet) {
        // Последовательность обхода вершин
        List<Vertex> res = [];
        // Хеш-множество для записи уже посещенных вершин
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
        Console.WriteLine("\nПосле инициализации граф имеет вид");
        graph.Print();

        /* Обход в глубину */
        List<Vertex> res = GraphDFS(graph, v[0]);
        Console.WriteLine("\nПоследовательность вершин при обходе в глубину (DFS)");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
