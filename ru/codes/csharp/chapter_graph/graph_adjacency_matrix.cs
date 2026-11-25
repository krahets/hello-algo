/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* Неориентированный граф на матрице смежности */
class GraphAdjMat {
    List<int> vertices;     // Список вершин: элементы — значения вершин, позиции — их индексы
    List<List<int>> adjMat; // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

    /* Конструктор */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = [];
        this.adjMat = [];
        // Добавить вершину
        foreach (int val in vertices) {
            AddVertex(val);
        }
        // Добавить ребро
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        foreach (int[] e in edges) {
            AddEdge(e[0], e[1]);
        }
    }

    /* Получить число вершин */
    int Size() {
        return vertices.Count;
    }

    /* Добавить вершину */
    public void AddVertex(int val) {
        int n = Size();
        // Добавить значение новой вершины в список вершин
        vertices.Add(val);
        // Добавить строку в матрицу смежности
        List<int> newRow = new(n);
        for (int j = 0; j < n; j++) {
            newRow.Add(0);
        }
        adjMat.Add(newRow);
        // Добавить столбец в матрицу смежности
        foreach (List<int> row in adjMat) {
            row.Add(0);
        }
    }

    /* Удалить вершину */
    public void RemoveVertex(int index) {
        if (index >= Size())
            throw new IndexOutOfRangeException();
        // Удалить из списка вершин вершину с индексом index
        vertices.RemoveAt(index);
        // Удалить из матрицы смежности строку с индексом index
        adjMat.RemoveAt(index);
        // Удалить из матрицы смежности столбец с индексом index
        foreach (List<int> row in adjMat) {
            row.RemoveAt(index);
        }
    }

    /* Добавить ребро */
    // Параметры i и j — индексы элементов vertices
    public void AddEdge(int i, int j) {
        // Проверить выход индексов за границы и их совпадение
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Удалить ребро */
    // Параметры i и j — индексы элементов vertices
    public void RemoveEdge(int i, int j) {
        // Проверить выход индексов за границы и их совпадение
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* Вывести матрицу смежности */
    public void Print() {
        Console.Write("Список вершин = ");
        PrintUtil.PrintList(vertices);
        Console.WriteLine("Матрица смежности =");
        PrintUtil.PrintMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* Инициализировать неориентированный граф */
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        int[] vertices = [1, 3, 2, 5, 4];
        int[][] edges = 
        [
            [0, 1],
            [0, 3],
            [1, 2],
            [2, 3],
            [2, 4],
            [3, 4]
        ];
        GraphAdjMat graph = new(vertices, edges);
        Console.WriteLine("\nГраф после инициализации:");
        graph.Print();

        /* Добавить ребро */
        // Индексы вершин 1 и 2 равны 0 и 2 соответственно
        graph.AddEdge(0, 2);
        Console.WriteLine("\nГраф после добавления ребра 1–2:");
        graph.Print();

        /* Удалить ребро */
        // Индексы вершин 1 и 3 равны 0 и 1 соответственно
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\nГраф после удаления ребра 1–3:");
        graph.Print();

        /* Добавить вершину */
        graph.AddVertex(6);
        Console.WriteLine("\nГраф после добавления вершины 6:");
        graph.Print();

        /* Удалить вершину */
        // Индекс вершины 3 равен 1
        graph.RemoveVertex(1);
        Console.WriteLine("\nГраф после удаления вершины 3:");
        graph.Print();
    }
}
