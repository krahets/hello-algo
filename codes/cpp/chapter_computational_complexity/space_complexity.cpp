/**
 * File: space_complexity.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <unordered_map>
using namespace std;

// 定义链表节点
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(nullptr) {}
};

// 定义二叉树节点
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};

/* 函数 */
int func() {
    // 执行某些操作
    return 0;
}

/* 常数阶 O(1) */
void constant(int n) {
    // 常量、变量、对象占用 O(1) 空间
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // 循环中的变量占用 O(1) 空间
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // 循环中的函数占用 O(1) 空间
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* 线性阶 O(n) */
void linear(int n) {
    // 长度为 n 的数组占用 O(n) 空间
    vector<int> nums(n);
    // 长度为 n 的列表占用 O(n) 空间
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // 长度为 n 的哈希表占用 O(n) 空间
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* 线性阶（递归）O(n) */
void linearRecur(int n) {
    cout << "递归 n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* 平方阶 O(n²) */
void quadratic(int n) {
    // 二维列表占用 O(n²) 空间
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* 平方阶（递归）O(n²) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "递归 n = " << n << " 中的 nums 长度 = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* 指数阶（满二叉树）O(2ⁿ) */
TreeNode *buildTree(int n) {
    if (n == 0)
        return nullptr;
    TreeNode *root = new TreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

// 释放二叉树内存
void freeMemoryTree(TreeNode *root) {
    if (root == nullptr) return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    delete root;
}

// 简单打印二叉树（仅演示结构）
void printTree(TreeNode *root) {
    if (!root) return;
    cout << root->val << " ";
    printTree(root->left);
    printTree(root->right);
}

/* Driver Code */
int main() {
    int n = 5;

    cout << "=== 常数阶 O(1) ===" << endl;
    constant(n);

    cout << "\n=== 线性阶 O(n) ===" << endl;
    linear(n);
    linearRecur(n);

    cout << "\n=== 平方阶 O(n²) ===" << endl;
    quadratic(n);
    quadraticRecur(n);

    cout << "\n=== 指数阶 O(2ⁿ) ===" << endl;
    TreeNode *root = buildTree(n);
    printTree(root);

    // 释放内存
    freeMemoryTree(root);

    cout << "\n\n所有空间复杂度示例运行完成！" << endl;
    return 0;
}
