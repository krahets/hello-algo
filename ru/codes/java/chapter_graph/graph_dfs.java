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
        res.add(vet);     // Отметить посещенную вершину
        visited.add(vet); // Отметить эту вершину как посещенную
        // Обойти все смежные вершины данной вершины
        for (Vertex adjVet : graph.adjList.get(vet)) {
            if (visited.contains(adjVet))
                continue; // Пропустить уже посещенную вершину
            // Рекурсивно обходить смежные вершины
            dfs(graph, visited, res, adjVet);
        }
    }

    /* Обход в глубину */
    // Использовать список смежности для представления графа, чтобы получить все смежные вершины заданной вершины
    static List<Vertex> graphDFS(GraphAdjList graph, Vertex startVet) {
        // Последовательность обхода вершин
        List<Vertex> res = new ArrayList<>();
        // Хеш-множество для хранения уже посещенных вершин
        Set<Vertex> visited = new HashSet<>();
        dfs(graph, visited, res, startVet);
        return res;
    }

    public static void main(String[] args) {
        /* Инициализация неориентированного графа */
        Vertex[] v = Vertex.valsToVets(new int[] { 0, 1, 2, 3, 4, 5, 6 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[5] }, { v[4], v[5] }, { v[5], v[6] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nГраф после инициализации");
        graph.print();

        /* Обход в глубину */
        List<Vertex> res = graphDFS(graph, v[0]);
        System.out.println("\nПоследовательность вершин при обходе в глубину (DFS)");
        System.out.println(Vertex.vetsToVals(res));
    }
}
