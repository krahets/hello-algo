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

/* 定数オーダー */
void constant(int n) {
    // 定数・変数・オブジェクトが使う領域は O(1)
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // ループ内の変数が使う領域は O(1)
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // ループ内の関数が使う領域は O(1)
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 線形オーダー */
void linear(int n) {
    // 長さ n の配列が使う領域は O(n)
    vector<int> nums(n);
    // 長さ n のリストが使う領域は O(n)
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // 長さ n のハッシュテーブルが使う領域は O(n)
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* 線形オーダー（再帰による実装） */
void linearRecur(int n) {
    cout << "再帰 n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 二次オーダー */
void quadratic(int n) {
    // 二次元リストが使う領域は O(n^2)
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* 二次オーダー（再帰による実装） */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "再帰 n = " << n << " での nums の長さ = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* 指数オーダー（すべての葉が同じ深さの完全二分木を構築） */
TreeNode *buildTree(int n) {
    if (n == 0)
        return nullptr;
    TreeNode *root = new TreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* 実行例 */
int main() {
    int n = 5;
    // 定数オーダー
    constant(n);
    // 線形オーダー
    linear(n);
    linearRecur(n);
    // 二次オーダー
    quadratic(n);
    quadraticRecur(n);
    // 指数オーダー
    TreeNode *root = buildTree(n);
    printTree(root);

    // メモリを解放
    freeMemoryTree(root);

    return 0;
}
