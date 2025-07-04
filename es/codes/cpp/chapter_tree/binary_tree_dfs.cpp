/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// 初始化列表，用于存储遍历序列
vector<int> vec;

/* 前序遍历 */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 访问优先级：根节点 -> 左子树 -> 右子树
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* 中序遍历 */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 访问优先级：左子树 -> 根节点 -> 右子树
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* 后序遍历 */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 访问优先级：左子树 -> 右子树 -> 根节点
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* Driver Code */
int main() {
    /* 初始化二叉树 */
    // 这里借助了一个从数组直接生成二叉树的函数
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "初始化二叉树\n" << endl;
    printTree(root);

    /* 前序遍历 */
    vec.clear();
    preOrder(root);
    cout << endl << "前序遍历的节点打印序列 = ";
    printVector(vec);

    /* 中序遍历 */
    vec.clear();
    inOrder(root);
    cout << endl << "中序遍历的节点打印序列 = ";
    printVector(vec);

    /* 后序遍历 */
    vec.clear();
    postOrder(root);
    cout << endl << "后序遍历的节点打印序列 = ";
    printVector(vec);

    return 0;
}
