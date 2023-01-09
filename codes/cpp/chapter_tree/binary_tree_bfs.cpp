/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../include/include.hpp"

/* 层序遍历 */
vector<int> hierOrder(TreeNode* root) {
    // 初始化队列，加入根结点
    queue<TreeNode*> queue;
    queue.push(root);
    // 初始化一个列表，用于保存遍历序列
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode* node = queue.front();
        queue.pop();                 // 队列出队
        vec.push_back(node->val);    // 保存结点
        if (node->left != nullptr)
            queue.push(node->left);  // 左子结点入队
        if (node->right != nullptr)
            queue.push(node->right); // 右子结点入队
    }
    return vec;
}


/* Driver Code */
int main() {
    /* 初始化二叉树 */
    // 这里借助了一个从数组直接生成二叉树的函数
    TreeNode* root = vecToTree(vector<int> { 1, 2, 3, 4, 5, 6, 7 });
    cout << endl << "初始化二叉树\n" << endl;
    PrintUtil::printTree(root);

    /* 层序遍历 */
    vector<int> vec = hierOrder(root);
    cout << endl << "层序遍历的结点打印序列 = ";
    PrintUtil::printVector(vec);

    return 0;
}
