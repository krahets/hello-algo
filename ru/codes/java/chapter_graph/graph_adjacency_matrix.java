/**
 * File: graph_adjacency_matrix.java
 * Created Time: 2023-01-26
 * Author: krahets (krahets@163.com)
 */

package chapter_graph;

import utils.*;
import java.util.*;

/* Неориентированный граф на матрице смежности */
class GraphAdjMat {
    List<Integer> vertices; // Список вершин: элементы — значения вершин, позиции — их индексы
    List<List<Integer>> adjMat; // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

    /* Конструктор */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = new ArrayList<>();
        this.adjMat = new ArrayList<>();
        // Добавить вершину
        for (int val : vertices) {
            addVertex(val);
        }
        // Добавить ребро
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        for (int[] e : edges) {
            addEdge(e[0], e[1]);
        }
    }

    /* Получить число вершин */
    public int size() {
        return vertices.size();
    }

    /* Добавить вершину */
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

    /* Удалить вершину */
    public void removeVertex(int index) {
        if (index >= size())
            throw new IndexOutOfBoundsException();
        // Удалить из списка вершин вершину с индексом index
        vertices.remove(index);
        // Удалить из матрицы смежности строку с индексом index
        adjMat.remove(index);
        // Удалить из матрицы смежности столбец с индексом index
        for (List<Integer> row : adjMat) {
            row.remove(index);
        }
    }

    /* Добавить ребро */
    // Параметры i и j — индексы элементов vertices
    public void addEdge(int i, int j) {
        // Проверить выход индексов за границы и их совпадение
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j)
            throw new IndexOutOfBoundsException();
        // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        adjMat.get(i).set(j, 1);
        adjMat.get(j).set(i, 1);
    }

    /* Удалить ребро */
    // Параметры i и j — индексы элементов vertices
    public void removeEdge(int i, int j) {
        // Проверить выход индексов за границы и их совпадение
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
        /* Инициализировать неориентированный граф */
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        int[] vertices = { 1, 3, 2, 5, 4 };
        int[][] edges = { { 0, 1 }, { 0, 3 }, { 1, 2 }, { 2, 3 }, { 2, 4 }, { 3, 4 } };
        GraphAdjMat graph = new GraphAdjMat(vertices, edges);
        System.out.println("\nГраф после инициализации:");
        graph.print();

        /* Добавить ребро */
        // Индексы вершин 1 и 2 равны 0 и 2 соответственно
        graph.addEdge(0, 2);
        System.out.println("\nГраф после добавления ребра 1–2:");
        graph.print();

        /* Удалить ребро */
        // Индексы вершин 1 и 3 равны 0 и 1 соответственно
        graph.removeEdge(0, 1);
        System.out.println("\nГраф после удаления ребра 1–3:");
        graph.print();

        /* Добавить вершину */
        graph.addVertex(6);
        System.out.println("\nГраф после добавления вершины 6:");
        graph.print();

        /* Удалить вершину */
        // Индекс вершины 3 равен 1
        graph.removeVertex(1);
        System.out.println("\nГраф после удаления вершины 3:");
        graph.print();
    }
}
