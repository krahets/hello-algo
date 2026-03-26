/**
 * File: graph_adjacency_matrix.cs
 * Created Time: 2023-02-06
 * Author: zjkung1123 (zjkung1123@gmail.com)
 */

namespace hello_algo.chapter_graph;

/* Класс неориентированного графа на основе матрицы смежности */
class GraphAdjMat {
    List<int> vertices;     // Список вершин: элементы представляют «значения вершин», а индексы представляют «индексы вершин»
    List<List<int>> adjMat; // Матрица смежности, индексы строк и столбцов соответствуют «индексам вершин»

    /* Конструктор */
    public GraphAdjMat(int[] vertices, int[][] edges) {
        this.vertices = [];
        this.adjMat = [];
        // Добавить вершину
        foreach (int val in vertices) {
            AddVertex(val);
        }
        // Добавить ребро
        // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
        foreach (int[] e in edges) {
            AddEdge(e[0], e[1]);
        }
    }

    /* Получить количество вершин */
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
        // Удалить вершину с индексом index из списка вершин
        vertices.RemoveAt(index);
        // Удалить строку с индексом index из матрицы смежности
        adjMat.RemoveAt(index);
        // Удалить столбец с индексом index из матрицы смежности
        foreach (List<int> row in adjMat) {
            row.RemoveAt(index);
        }
    }

    /* Добавить ребро */
    // Параметры i и j соответствуют индексам элементов vertices
    public void AddEdge(int i, int j) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        // В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Удалить ребро */
    // Параметры i и j соответствуют индексам элементов vertices
    public void RemoveEdge(int i, int j) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= Size() || j >= Size() || i == j)
            throw new IndexOutOfRangeException();
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* Вывести матрицу смежности */
    public void Print() {
        Console.Write("список вершин =");
        PrintUtil.PrintList(vertices);
        Console.WriteLine("матрица смежности =");
        PrintUtil.PrintMatrix(adjMat);
    }
}

public class graph_adjacency_matrix {
    [Test]
    public void Test() {
        /* Инициализировать неориентированный граф */
        // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
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
        Console.WriteLine("\nПосле инициализации граф имеет вид");
        graph.Print();

        /* Добавить ребро */
        // Индексы вершин 1 и 2 равны 0 и 2 соответственно
        graph.AddEdge(0, 2);
        Console.WriteLine("\nДобавить ребро 1-2 после, графравно");
        graph.Print();

        /* Удалить ребро */
        // Индексы вершин 1 и 3 равны 0 и 1 соответственно
        graph.RemoveEdge(0, 1);
        Console.WriteLine("\nУдалить ребро 1-3 после, графравно");
        graph.Print();

        /* Добавить вершину */
        graph.AddVertex(6);
        Console.WriteLine("\nДобавить вершину 6 после, графравно");
        graph.Print();

        /* Удалить вершину */
        // Индекс вершины 3 равен 1
        graph.RemoveVertex(1);
        Console.WriteLine("\nУдалить вершину 3 после, графравно");
        graph.Print();
    }
}
