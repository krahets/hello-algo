/**
 * File: graph_adjacency_matrix.cpp
 * Created Time: 2023-02-09
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 以鄰接矩陣實作的無向圖類別 */
class GraphAdjMat {
    vector<int> vertices;       // 頂點清單，元素代表頂點值，索引代表頂點索引
    vector<vector<int>> adjMat; // 鄰接矩陣，橫列與直行的索引皆對應頂點索引

  public:
    /* 建構式 */
    GraphAdjMat(const vector<int> &vertices, const vector<vector<int>> &edges) {
        // 新增頂點
        for (int val : vertices) {
            addVertex(val);
        }
        // 新增邊
        // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
        for (const vector<int> &edge : edges) {
            addEdge(edge[0], edge[1]);
        }
    }

    /* 取得頂點數量 */
    int size() const {
        return vertices.size();
    }

    /* 新增頂點 */
    void addVertex(int val) {
        int n = size();
        // 將新頂點的值加入頂點清單
        vertices.push_back(val);
        // 在鄰接矩陣中新增一個橫列
        adjMat.emplace_back(vector<int>(n, 0));
        // 在鄰接矩陣中新增一個直行
        for (vector<int> &row : adjMat) {
            row.push_back(0);
        }
    }

    /* 刪除頂點 */
    void removeVertex(int index) {
        if (index >= size()) {
            throw out_of_range("頂點不存在");
        }
        // 從頂點清單中移除索引為 index 的頂點
        vertices.erase(vertices.begin() + index);
        // 從鄰接矩陣中刪除索引為 index 的橫列
        adjMat.erase(adjMat.begin() + index);
        // 從鄰接矩陣中刪除索引為 index 的直行
        for (vector<int> &row : adjMat) {
            row.erase(row.begin() + index);
        }
    }

    /* 新增邊 */
    // 參數 i、j 為 vertices 中的元素索引
    void addEdge(int i, int j) {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("頂點不存在");
        }
        // 無向圖的鄰接矩陣對主對角線對稱，也就是位置 (i, j) 與 (j, i) 的值滿足 (i, j) == (j, i)
        adjMat[i][j] = 1;
        adjMat[j][i] = 1;
    }

    /* 刪除邊 */
    // 參數 i、j 為 vertices 中的元素索引
    void removeEdge(int i, int j) {
        // 處理索引超出範圍或兩個索引相同的情形
        if (i < 0 || j < 0 || i >= size() || j >= size() || i == j) {
            throw out_of_range("頂點不存在");
        }
        adjMat[i][j] = 0;
        adjMat[j][i] = 0;
    }

    /* 印出鄰接矩陣 */
    void print() {
        cout << "頂點清單 = ";
        printVector(vertices);
        cout << "鄰接矩陣 =" << endl;
        printVectorMatrix(adjMat);
    }
};

/* Driver Code */
int main() {
    /* 初始化無向圖 */
    // 注意：edges 中每條邊的兩端用頂點索引表示，也就是 vertices 中的元素索引
    vector<int> vertices = {1, 3, 2, 5, 4};
    vector<vector<int>> edges = {{0, 1}, {0, 3}, {1, 2}, {2, 3}, {2, 4}, {3, 4}};
    GraphAdjMat graph(vertices, edges);
    cout << "\n初始化後的圖為" << endl;
    graph.print();

    /* 新增邊 */
    // 頂點 1、2 的索引分別為 0、2
    graph.addEdge(0, 2);
    cout << "\n新增邊 1-2 後的圖為" << endl;
    graph.print();

    /* 刪除邊 */
    // 頂點 1、3 的索引分別為 0、1
    graph.removeEdge(0, 1);
    cout << "\n刪除邊 1-3 後的圖為" << endl;
    graph.print();

    /* 新增頂點 */
    graph.addVertex(6);
    cout << "\n新增頂點 6 後的圖為" << endl;
    graph.print();

    /* 刪除頂點 */
    // 頂點 3 的索引為 1
    graph.removeVertex(1);
    cout << "\n刪除頂點 3 後的圖為" << endl;
    graph.print();

    return 0;
}
