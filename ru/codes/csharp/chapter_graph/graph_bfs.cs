/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* Обход в ширину */
    // Список смежности позволяет получить всех соседей заданной вершины
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // Порядок обхода вершин
        List<Vertex> res = [];
        // Хеш-множество посещённых вершин
        HashSet<Vertex> visited = [startVet];
        // Очередь для обхода BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // Начать с вершины vet и повторять, пока не будут посещены все вершины
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // Извлечь первую вершину из очереди
            res.Add(vet);               // Записать посещённую вершину
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // Пропустить посещённые вершины
                }
                que.Enqueue(adjVet);   // Добавить в очередь только непосещённые вершины
                visited.Add(adjVet);   // Отметить вершину как посещённую
            }
        }

        // Вернуть порядок обхода вершин
        return res;
    }

    [Test]
    public void Test() {
        /* Инициализировать неориентированный граф */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[1], v[4]], [v[2], v[5]], [v[3], v[4]],
            [v[3], v[6]], [v[4], v[5]], [v[4], v[7]],
            [v[5], v[8]], [v[6], v[7]], [v[7], v[8]]
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\nГраф после инициализации:");
        graph.Print();

        /* Обход в ширину */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\nПорядок обхода вершин в ширину (BFS):");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
