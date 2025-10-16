/**
 * File: space_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 関数 */
int func() {
    // 何らかの操作を実行
    return 0;
}

/* 定数計算量 */
void constant(int n) {
    // 定数、変数、オブジェクトは O(1) 空間を占める
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // ループ内の変数は O(1) 空間を占める
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // ループ内の関数は O(1) 空間を占める
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 線形計算量 */
void linear(int n) {
    // 長さ n の配列は O(n) 空間を占める
    vector<int> nums(n);
    // 長さ n のリストは O(n) 空間を占める
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // 長さ n のハッシュテーブルは O(n) 空間を占める
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* 線形計算量（再帰実装） */
void linearRecur(int n) {
    cout << "再帰 n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 二次計算量 */
void quadratic(int n) {
    // 二次元リストは O(n^2) 空間を占める
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* 二次計算量（再帰実装） */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "再帰 n = " << n << ", nums の長さ = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* 指数計算量（完全二分木の構築） */
TreeNode *buildTree(int n) {
    if (n == 0)
        return nullptr;
    TreeNode *root = new TreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* ドライバーコード */
int main() {
    int n = 5;
    // 定数計算量
    constant(n);
    // 線形計算量
    linear(n);
    linearRecur(n);
    // 二次計算量
    quadratic(n);
    quadraticRecur(n);
    // 指数計算量
    TreeNode *root = buildTree(n);
    printTree(root);

    // メモリを解放
    freeMemoryTree(root);

    return 0;
}