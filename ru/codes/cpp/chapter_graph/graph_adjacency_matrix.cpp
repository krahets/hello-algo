/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Неориентированный граф на матрице смежности */
class GraphAdjMat {
    vector<int> vertices;       // Список вершин: элементы — значения вершин, позиции — их индексы
    vector<vector<int>> adjMat; // Матрица смежности: индексы строк и столбцов соответствуют индексам вершин

  public:
    /* Конструктор */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // Добавить вершину
        for (int val : vertices) {
            addVertex(val);
        }
        // Добавить ребро
        // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* Получить число вершин */
    int size() const {
        return vertices.size();
    }

    /* Добавить вершину */
    void addVertex(int val) {
        int n = size();
        // Добавить значение новой вершины в список вершин
        vertices.push_back(val);
        // Добавить строку в матрицу смежности
        adjMat.emplace_back(vector<int>(n, 0));
        // Добавить столбец в матрицу смежности
        for (vector<int> &row : adjMat) {
            row.push_back(0);
        }
    }

    /* Удалить вершину */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("Вершина не существует");
        }
        // Удалить из списка вершин вершину с индексом index
        vertices.erase(vertices.begin() + index);
        // Удалить из матрицы смежности строку с индексом index
        adjMat.erase(adjMat.begin() + index);
        // Удалить из матрицы смежности столбец с индексом index
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* Добавить ребро */
    // Параметры i и j — индексы элементов vertices
    void addEdge(int i, int j) {
        // Проверить выход индексов за границы и их совпадение
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Вершина не существует");
        }
        // Матрица смежности неориентированного графа симметрична относительно главной диагонали: (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Удалить ребро */
    // Параметры i и j — индексы элементов vertices
    void removeEdge(int i, int j) {
        // Проверить выход индексов за границы и их совпадение
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("Вершина не существует");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* Вывести матрицу смежности */
    void print() {
        cout << "Список вершин = ";
        printVector(vertices);
        cout << "Матрица смежности =" << endl;
        printVectorMatrix(adjMat);
    }
};

/* Пример использования */
int main() {
    /* Инициализировать неориентированный граф */
    // Элементы edges содержат индексы вершин, то есть индексы элементов vertices
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\nГраф после инициализации:" << endl;
    graph.print();

    /* Добавить ребро */
    // Индексы вершин 1 и 2 равны 0 и 2 соответственно
    graph.addEdge(0, 2);
    cout << "\nГраф после добавления ребра 1–2:" << endl;
    graph.print();

    /* Удалить ребро */
    // Индексы вершин 1 и 3 равны 0 и 1 соответственно
    graph.removeEdge(0, 1);
    cout << "\nГраф после удаления ребра 1–3:" << endl;
    graph.print();

    /* Добавить вершину */
    graph.addVertex(6);
    cout << "\nГраф после добавления вершины 6:" << endl;
    graph.print();

    /* Удалить вершину */
    // Индекс вершины 3 равен 1
    graph.removeVertex(1);
    cout << "\nГраф после удаления вершины 3:" << endl;
    graph.print();

    return 0;
}
