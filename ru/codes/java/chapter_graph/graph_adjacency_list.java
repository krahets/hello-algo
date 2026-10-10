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
    // Список смежности, где key — вершина, а value — все смежные ей вершины
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

    /* Получить число вершин */
    public int size() {
        return adjList.size();
    }

    /* Добавление ребра */
    public void addEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // Добавить ребро vet1 - vet2
        adjList.get(vet1).add(vet2);
        adjList.get(vet2).add(vet1);
    }

    /* Удаление ребра */
    public void removeEdge(Vertex vet1, Vertex vet2) {
        if (!adjList.containsKey(vet1) || !adjList.containsKey(vet2) || vet1 == vet2)
            throw new IllegalArgumentException();
        // Удалить ребро vet1 - vet2
        adjList.get(vet1).remove(vet2);
        adjList.get(vet2).remove(vet1);
    }

    /* Добавление вершины */
    public void addVertex(Vertex vet) {
        if (adjList.containsKey(vet))
            return;
        // Добавить новый список в список смежности
        adjList.put(vet, new ArrayList<>());
    }

    /* Удаление вершины */
    public void removeVertex(Vertex vet) {
        if (!adjList.containsKey(vet))
            throw new IllegalArgumentException();
        // Удалить из списка смежности список, соответствующий вершине vet
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
        /* Инициализация неориентированного графа */
        Vertex[] v = Vertex.valsToVets(new int[] { 1, 3, 2, 5, 4 });
        Vertex[][] edges = { { v[0], v[1] }, { v[0], v[3] }, { v[1], v[2] },
                             { v[2], v[3] }, { v[2], v[4] }, { v[3], v[4] } };
        GraphAdjList graph = new GraphAdjList(edges);
        System.out.println("\nГраф после инициализации");
        graph.print();

        /* Добавление ребра */
        // Вершины 1 и 2 соответствуют v[0] и v[2]
        graph.addEdge(v[0], v[2]);
        System.out.println("\nГраф после добавления ребра 1-2");
        graph.print();

        /* Удаление ребра */
        // Вершины 1 и 3 соответствуют v[0] и v[1]
        graph.removeEdge(v[0], v[1]);
        System.out.println("\nГраф после удаления ребра 1-3");
        graph.print();

        /* Добавление вершины */
        Vertex v5 = new Vertex(6);
        graph.addVertex(v5);
        System.out.println("\nГраф после добавления вершины 6");
        graph.print();

        /* Удаление вершины */
        // Вершина 3 соответствует v[1]
        graph.removeVertex(v[1]);
        System.out.println("\nГраф после удаления вершины 3");
        graph.print();
    }
}
