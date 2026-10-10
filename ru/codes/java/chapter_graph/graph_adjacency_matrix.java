/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import utils.*;
import java.util.*;

/* Класс неориентированного графа на основе матрицы смежности */
class GraphAdjMat {
    List<Integer> vertices; // Список вершин: элементы представляют «значения вершин», а индексы — «индексы вершин»
    List<List<Integer>> adjMat; // Матрица смежности, где индексы строк и столбцов соответствуют «индексам вершин»

    /* Конструктор */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // Добавление вершины
        for (int val : vertices) {
            addVertex(val);
        }
        // Добавить ребра
        // Обратите внимание: элементы edges представляют собой индексы вершин, то есть соответствуют индексам элементов vertices
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* Получить число вершин */
    public int size() {
        return vertices.size();
    }

    /* Добавление вершины */
    public void addVertex(int val) {
        int n = size();
        // Добавить значение новой вершины в список вершин
        vertices.add(val);
        // Добавить строку в матрицу смежности
        List<Integer> newRow = new ArrayList<>(n);
        for (int j = 0; j < n; j++) {
            newRow.add(0);
        }
        adjMat.add(newRow);
        // Добавить столбец в матрицу смежности
        for (List<Integer> row : adjMat) {
            row.add(0);
        }
    }

    /* Удаление вершины */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // Удалить вершину с индексом index из списка вершин
        vertices.remove(index);
        // Удалить строку с индексом index из матрицы смежности
        adjMat.remove(index);
        // Удалить столбец с индексом index из матрицы смежности
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* Добавление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    public void addEdge(int i, int j) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* Удаление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    public void removeEdge(int i, int j) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        adjMat.get(i).set(j, 0);
        adjMat.get(j).set(i, 0);
    }

    /* Вывести матрицу смежности */
    public void print() {
        System.out.print("Список вершин = ");
        System.out.println(vertices);
        System.out.println("Матрица смежности =");
        PrintUtil.printMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    public static void main(String[] args) {
        /* Инициализация неориентированного графа */
        // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\nГраф после инициализации");
        graph.print();

        /* Добавление ребра */
        // Индексы вершин 1 и 2 равны 0 и 2 соответственно
        graph.addEdge(0, 2);
        System.out.println("\nГраф после добавления ребра 1-2");
        graph.print();

        /* Удаление ребра */
        // Индексы вершин 1 и 3 равны 0 и 1 соответственно
        graph.removeEdge(0, 1);
        System.out.println("\nГраф после удаления ребра 1-3");
        graph.print();

        /* Добавление вершины */
        graph.addVertex(6);
        System.out.println("\nГраф после добавления вершины 6");
        graph.print();

        /* Удаление вершины */
        // Индекс вершины 3 равен 1
        graph.removeVertex(1);
        System.out.println("\nГраф после удаления вершины 3");
        graph.print();
    }
}
