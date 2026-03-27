/**
 * File: graph_adjacency_list.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import java.util.*;
import utils.*;

/* Класс неориентированного графа на основе списка смежности */
class GraphAdjList {
    // Список смежности, key: вершина, value: все смежные с ней вершины
    Map<Vertex, List<Vertex>> adjList;

    /* Конструктор */
    public GraphAdjList(Vertex[][] edges) {
        this.adjList = new HashMap<>();
        // Добавить все вершины и ребра
        for (Vertex[] edge : edges) {
            addVertex(edge[0]);
            addVertex(edge[1]);
            addEdge(edge[0], edge[1]);
        }
    }

    /* Получить количество вершин */
    public int size() {
        return adjList.size();
    }

    /* Добавить ребро */
    public void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // Добавить ребро vet1 - vet2
        adjList.get(vet1).add(vet2);
        adjList.get(vet2).add(vet1);
    }

    /* Удалить ребро */
    public void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // Удалить ребро vet1 - vet2
        adjList.get(vet1).remove(vet2);
        adjList.get(vet2).remove(vet1);
    }

    /* Добавить вершину */
    public void addVertex(Vertex vet) {
        if (adjList.containsKey(vet))
            return;
        // Добавить новый связный список в список смежности
        adjList.put(vet, new ArrayList<>());
    }

    /* Удалить вершину */
    public void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet))
            throw new IllegalArgumentException();
        // Удалить из списка смежности связный список, соответствующий вершине vet
        adjList.remove(vet);
        // Обойти списки других вершин и удалить все ребра, содержащие vet
        for (List<Vertex> list : adjList.values()) {
            list.remove(vet);
        }
    }

    /* Вывести список смежности */
    public void print() {
        System.out.println("Список смежности =");
        for (Map.Entry<Vertex, List<Vertex>> pair : adjList.entrySet()) {
            List<Integer> tmp = new ArrayList<>();
            for (Vertex vertex : pair.getValue())
                tmp.add(vertex.val);
            System.out.println(pair.getKey().val + ": " + tmp + ",");
        }
    }
}

public class graph_adjacency_list {
    public static void main(String[] args) {
        /* Инициализировать неориентированный граф */
        Vertex[] v = Vertex.valsToVets(new int[] { 1, 3, 2, 5, 4 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[3] }, { v[2], v[4] }, { v[3], v[4] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nПосле инициализации граф имеет вид");
        graph.print();

        /* Добавить ребро */
        // Вершины 1 и 2, то есть v[0] и v[2]
        graph.addEdge(v[0], v[2]);
        System.out.println("\nПосле добавления ребра 1-2 граф имеет вид");
        graph.print();

        /* Удалить ребро */
        // Вершины 1 и 3, то есть v[0] и v[1]
        graph.removeEdge(v[0], v[1]);
        System.out.println("\nПосле удаления ребра 1-3 граф имеет вид");
        graph.print();

        /* Добавить вершину */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        System.out.println("\nПосле добавления вершины 6 граф имеет вид");
        graph.print();

        /* Удалить вершину */
        // Вершина 3, то есть v[1]
        graph.removeVertex(v[1]);
        System.out.println("\nПосле удаления вершины 3 граф имеет вид");
        graph.print();
    }
}
