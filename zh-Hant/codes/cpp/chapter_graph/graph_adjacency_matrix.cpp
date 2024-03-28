/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 基於鄰接矩陣實現的無向圖類別 */
class GraphAdjMat {
    vector<int> vertices;       // 頂點串列，元素代表“頂點值”，索引代表“頂點索引”
    vector<vector<int>> adjMat; // 鄰接矩陣，行列索引對應“頂點索引”

  public:
    /* 建構子 */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // 新增頂點
        for (int val : vertices) {
            addVertex(val);
        }
        // 新增邊
        // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* 獲取頂點數量 */
    int size() const {
        return vertices.size();
    }

    /* 新增頂點 */
    void addVertex(int val) {
        int n = size();
        // 向頂點串列中新增新頂點的值
        vertices.push_back(val);
        // 在鄰接矩陣中新增一行
        adjMat.emplace_back(vector<int>(n, 0));
        // 在鄰接矩陣中新增一列
        for (vector<int> &row : adjMat) {
            row.push_back(0);
        }
    }

    /* 刪除頂點 */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("頂點不存在");
        }
        // 在頂點串列中移除索引 index 的頂點
        vertices.erase(vertices.begin() + index);
        // 在鄰接矩陣中刪除索引 index 的行
        adjMat.erase(adjMat.begin() + index);
        // 在鄰接矩陣中刪除索引 index 的列
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* 新增邊 */
    // 參數 i, j 對應 vertices 元素索引
    void addEdge(int i, int j) {
        // 索引越界與相等處理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("頂點不存在");
        }
        // 在無向圖中，鄰接矩陣關於主對角線對稱，即滿足 (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* 刪除邊 */
    // 參數 i, j 對應 vertices 元素索引
    void removeEdge(int i, int j) {
        // 索引越界與相等處理
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("頂點不存在");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* 列印鄰接矩陣 */
    void print() {
        cout << "頂點串列 = ";
        printVector(vertices);
        cout << "鄰接矩陣 =" << endl;
        printVectorMatrix(adjMat);
    }
};

/* Driver Code */
int main() {
    /* 初始化無向圖 */
    // 請注意，edges 元素代表頂點索引，即對應 vertices 元素索引
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\n初始化後，圖為" << endl;
    graph.print();

    /* 新增邊 */
    // 頂點 1, 2 的索引分別為 0, 2
    graph.addEdge(0, 2);
    cout << "\n新增邊 1-2 後，圖為" << endl;
    graph.print();

    /* 刪除邊 */
    // 頂點 1, 3 的索引分別為 0, 1
    graph.removeEdge(0, 1);
    cout << "\n刪除邊 1-3 後，圖為" << endl;
    graph.print();

    /* 新增頂點 */
    graph.addVertex(6);
    cout << "\n新增頂點 6 後，圖為" << endl;
    graph.print();

    /* 刪除頂點 */
    // 頂點 3 的索引為 1
    graph.removeVertex(1);
    cout << "\n刪除頂點 3 後，圖為" << endl;
    graph.print();

    return 0;
}
