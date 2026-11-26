/**
 * File: graph_dfs.java
 * Created Time: 2023-02-12
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

public class graph_dfs {
    /* Вспомогательная функция обхода в глубину */
    static void dfs(GraphAdjList graph, Set<Vertex> visited, List<Vertex> res, Vertex vet) {
        res.add(vet);     // Записать посещённую вершину
        visited.add(vet); // Отметить вершину как посещённую
        // Перебрать всех соседей этой вершины
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // Пропустить посещённые вершины
            // Рекурсивно посетить соседнюю вершину
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Обход в глубину */
    // Список смежности позволяет получить всех соседей заданной вершины
    static List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // Порядок обхода вершин
        List<Vertex> res = new ArrayList<>();
        // Хеш-множество посещённых вершин
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }

    public static void main(String[] args) {
        /* Инициализировать неориентированный граф */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[5] }, { v[4], v[5] }, { v[5], v[6] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nГраф после инициализации:");
        graph.print();

        /* Обход в глубину */
        List<Vertex> res = graphDFS(graph, v[0]);
        System.out.println("\nПорядок обхода вершин в глубину (DFS):");
        System.out.println(Vertex.vetsToVals(res));
    }
}
