/**
 * File: graph_bfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_bfs {
    /* Обход в ширину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    static List<Vertex> graphBFS(GraphAdjList graph, Vertex startVet) {
        // Последовательность обхода вершин
        List<Vertex> res = new ArrayList<>();
        // Хеш-множество для хранения уже посещенных вершин
        Set<Vertex> visited = new HashSet<>();
        visited.add(startVet);
        // Очередь используется для реализации BFS
        Queue<Vertex> que = new LinkedList<>();
        que.offer(startVet);
        // Начиная с вершины vet, продолжать цикл, пока не будут посещены все вершины
        while (!que.isEmpty()) {
            Vertex vet = que.poll(); // Извлечь головную вершину из очереди
            res.add(vet);            // Отметить посещенную вершину
            // Обойти все смежные вершины данной вершины
            for (Vertex adjVet : graph.adjList.get(vet)) {
                if (visited.contains(adjVet))
                    continue;        // Пропустить уже посещенную вершину
                que.offer(adjVet);   // Помещать в очередь только непосещенные вершины
                visited.add(adjVet); // Отметить эту вершину как посещенную
            }
        }
        // Вернуть последовательность обхода вершин
        return res;
    }

    public static void main(String[] args) {
        /* Инициализация неориентированного графа */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] }, { v[1], v[4] },
                             { v[2], v[5] }, { v[3], v[4] }, { v[3], v[6] }, { v[4], v[5] },
                             { v[4], v[7] }, { v[5], v[8] }, { v[6], v[7] }, { v[7], v[8] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nГраф после инициализации");
        graph.print();

        /* Обход в ширину */
        List<Vertex> res = graphBFS(graph, v[0]);
        System.out.println("\nПоследовательность вершин при обходе в ширину (BFS)");
        System.out.println(Vertex.vetsToVals(res));
    }
}
