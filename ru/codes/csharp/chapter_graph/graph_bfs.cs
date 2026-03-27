/**
 * File: graph_bfs.cs
 * Created Time: 2023-03-08
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_graph;

public class graph_bfs {
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    List<Vertex> GraphBFS(GraphAdjList graph, Vertex startVet) {
        // Последовательность обхода вершин
        List<Vertex> res = [];
        // Хеш-множество для хранения уже посещенных вершин
        HashSet<Vertex> visited = [startVet];
        // Очередь используется для реализации BFS
        Queue<Vertex> que = new();
        que.Enqueue(startVet);
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while (que.Count > 0) {
            Vertex vet = que.Dequeue(); // Извлечь головную вершину из очереди
            res.Add(vet);               // Отметить посещенную вершину
            foreach (Vertex adjVet in graph.adjList[vet]) {
                if (visited.Contains(adjVet)) {
                    continue;          // Пропустить уже посещенную вершину
                }
                que.Enqueue(adjVet);   // Помещать в очередь только непосещенные вершины
                visited.Add(adjVet);   // Отметить эту вершину как посещенную
            }
        }

        // Вернуть последовательность обхода вершин
        return res;
    }

    [Test]
    public void Test() {
        /* Инициализация неориентированного графа */
        Vertex[] v = Vertex.ValsToVets([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
        Vertex[][] edges =
        [
            [v[0], v[1]], [v[0], v[3]], [v[1], v[2]],
            [v[1], v[4]], [v[2], v[5]], [v[3], v[4]],
            [v[3], v[6]], [v[4], v[5]], [v[4], v[7]],
            [v[5], v[8]], [v[6], v[7]], [v[7], v[8]]
        ];

        GraphAdjList graph = new(edges);
        Console.WriteLine("\nГраф после инициализации");
        graph.Print();

        /* Обход в ширину */
        List<Vertex> res = GraphBFS(graph, v[0]);
        Console.WriteLine("\nПоследовательность вершин при обходе в ширину (BFS)");
        Console.WriteLine(string.Join(" ", Vertex.VetsToVals(res)));
    }
}
