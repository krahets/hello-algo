/**
 * File: space_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 函式 */
int func() {
    // 執行某些操作
    return 0;
}

/* 常數階 */
void constant(int n) {
    // 常數、變數、物件佔用 O(1) 空間
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // 迴圈中的變數佔用 O(1) 空間
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // 迴圈中的函式佔用 O(1) 空間
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 線性階 */
void linear(int n) {
    // 長度為 n 的陣列佔用 O(n) 空間
    vector<int> nums(n);
    // 長度為 n 的串列佔用 O(n) 空間
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // 長度為 n 的雜湊表佔用 O(n) 空間
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* 線性階（遞迴實現） */
void linearRecur(int n) {
    cout << "遞迴 n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 平方階 */
void quadratic(int n) {
    // 二維串列佔用 O(n^2) 空間
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* 平方階（遞迴實現） */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "遞迴 n = " << n << " 中的 nums 長度 = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* 指數階（建立滿二元樹） */
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
    // 常數階
    constant(n);
    // 線性階
    linear(n);
    linearRecur(n);
    // 平方階
    quadratic(n);
    quadraticRecur(n);
    // 指數階
    TreeNode *root = buildTree(n);
    printTree(root);

    // 釋放記憶體
    freeMemoryTree(root);

    return 0;
}
