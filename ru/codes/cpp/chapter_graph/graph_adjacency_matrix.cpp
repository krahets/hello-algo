/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* Класс неориентированного графа на основе матрицы смежности */
class GraphAdjMat {
    vector<int> vertices;       // Список вершин: элементы представляют «значения вершин», а индексы — «индексы вершин»
    vector<vector<int>> adjMat; // Матрица смежности, где индексы строк и столбцов соответствуют «индексам вершин»

  public:
    /* Конструктор */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // Добавление вершины
        for (int val : vertices) {
            addVertex(val);
        }
        // Добавить ребра
        // Обратите внимание: элементы edges представляют собой индексы вершин, то есть соответствуют индексам элементов vertices
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* Получить число вершин */
    int size() const {
        return vertices.size();
    }

    /* Добавление вершины */
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

    /* Удаление вершины */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("вершина не существует");
        }
        // Удалить вершину с индексом index из списка вершин
        vertices.erase(vertices.begin() + index);
        // Удалить строку с индексом index из матрицы смежности
        adjMat.erase(adjMat.begin() + index);
        // Удалить столбец с индексом index из матрицы смежности
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* Добавление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    void addEdge(int i, int j) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("вершина не существует");
        }
        // В неориентированном графе матрица смежности симметрична относительно главной диагонали, то есть выполняется (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* Удаление ребра */
    // Параметры i и j соответствуют индексам элементов vertices
    void removeEdge(int i, int j) {
        // Обработка выхода индекса за границы и случая равенства
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("вершина не существует");
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

/* Driver Code */
int main() {
    /* Инициализация неориентированного графа */
    // Обратите внимание: элементы edges представляют индексы вершин, то есть соответствуют индексам элементов vertices
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\nПосле инициализации граф имеет вид" << endl;
    graph.print();

    /* Добавление ребра */
    // Индексы вершин 1 и 2 равны 0 и 2 соответственно
    graph.addEdge(0, 2);
    cout << "\nПосле добавления ребра 1-2 граф имеет вид" << endl;
    graph.print();

    /* Удаление ребра */
    // Индексы вершин 1 и 3 равны 0 и 1 соответственно
    graph.removeEdge(0, 1);
    cout << "\nПосле удаления ребра 1-3 граф имеет вид" << endl;
    graph.print();

    /* Добавление вершины */
    graph.addVertex(6);
    cout << "\nПосле добавления вершины 6 граф имеет вид" << endl;
    graph.print();

    /* Удаление вершины */
    // Индекс вершины 3 равен 1
    graph.removeVertex(1);
    cout << "\nПосле удаления вершины 3 граф имеет вид" << endl;
    graph.print();

    return 0;
}
