/**
 * File: space_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 関数 */
int func() {
    // 何らかの処理を行う
    return 0;
}

/* 定数階 */
void constant(int n) {
    // 定数、変数、オブジェクトは O(1) の空間を占める
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // ループ内の変数は O(1) の空間を占める
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // ループ内の関数は O(1) の空間を占める
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 線形階 */
void linear(int n) {
    // 長さ n の配列は O(n) の空間を使用
    vector<int> nums(n);
    // 長さ n のリストは O(n) の空間を使用
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // 長さ n のハッシュテーブルは O(n) の空間を使用
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* 線形時間（再帰実装） */
void linearRecur(int n) {
    cout << "再帰 n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 二乗階 */
void quadratic(int n) {
    // 二次元リストは O(n^2) の空間を使用
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* 二次時間（再帰実装） */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "再帰 n = " << n << " における nums の長さ = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* 指数時間（完全二分木の構築） */
TreeNode *buildTree(int n) {
    if (n == 0)
        return nullptr;
    TreeNode *root = new TreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* Driver Code */
int main() {
    int n = 5;
    // 定数階
    constant(n);
    // 線形階
    linear(n);
    linearRecur(n);
    // 二乗階
    quadratic(n);
    quadraticRecur(n);
    // 指数オーダー
    TreeNode *root = buildTree(n);
    printTree(root);

    // メモリを解放する
    freeMemoryTree(root);

    return 0;
}
