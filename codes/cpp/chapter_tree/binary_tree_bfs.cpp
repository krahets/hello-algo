/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代 C++ 规范、鲁棒性、const 正确性、可读性
 */

#include "../utils/common.hpp"
#include <queue>
#include <vector>
#include <iostream>

/* 层序遍历（BFS）*/
std::vector<int> levelOrder(const TreeNode* root) {
    std::vector<int> result;
    // 处理空树，防止空指针访问
    if (root == nullptr) {
        return result;
    }

    std::queue<const TreeNode*> nodeQueue;
    nodeQueue.push(root);

    while (!nodeQueue.empty()) {
        // 取出队首节点
        const TreeNode* currentNode = nodeQueue.front();
        nodeQueue.pop();

        // 访问节点
        result.push_back(currentNode->val);

        // 左子节点入队
        if (currentNode->left != nullptr) {
            nodeQueue.push(currentNode->left);
        }
        // 右子节点入队
        if (currentNode->right != nullptr) {
            nodeQueue.push(currentNode->right);
        }
    }

    return result;
}

/* Driver Code */
int main() {
    // 初始化二叉树
    const std::vector<int> treeArray = {1, 2, 3, 4, 5, 6, 7};
    TreeNode* root = vectorToTree(treeArray);

    std::cout << "\n初始化二叉树\n";
    printTree(root);

    // 层序遍历
    std::vector<int> result = levelOrder(root);
    std::cout << "\n层序遍历的节点序列 = ";
    printVector(result);

    // 释放内存（重要！防止内存泄漏）
    freeMemoryTree(root);

    return 0;
}
