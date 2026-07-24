/**
 * File: binary_tree.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 内存安全、代码整洁、现代 C++ 规范、鲁棒性
 */

#include "../utils/common.hpp"
#include <iostream>

// 工具函数：创建节点（简化代码）
TreeNode* createNode(int val) {
    return new TreeNode(val);
}

/* Driver Code */
int main() {
    // 初始化二叉树（使用 RAII 思想，统一管理）
    TreeNode* n1 = createNode(1);
    TreeNode* n2 = createNode(2);
    TreeNode* n3 = createNode(3);
    TreeNode* n4 = createNode(4);
    TreeNode* n5 = createNode(5);

    // 构建树结构
    n1->left  = n2;
    n1->right = n3;
    n2->left  = n4;
    n2->right = n5;

    std::cout << "\n初始化二叉树\n";
    printTree(n1);

    /* 插入节点 */
    TreeNode* P = createNode(0);
    // 在 n1 与 n2 之间插入节点 P
    n1->left = P;
    P->left = n2;

    std::cout << "\n插入节点 P 后\n";
    printTree(n1);

    /* 删除节点 P */
    n1->left = n2;   // 重新连接
    delete P;        // 释放插入的节点
    P = nullptr;     // 置空，避免野指针

    std::cout << "\n删除节点 P 后\n";
    printTree(n1);

    // 统一释放整棵树的内存
    freeMemoryTree(n1);

    return 0;
}
