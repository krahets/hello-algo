/**
 * File: binary_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 初始化二叉树 */
    // 初始化节点
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // 构建节点之间的引用（指针）
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    cout << endl << "初始化二叉树\n" << endl;
    printTree(n1);

    /* 插入与删除节点 */
    TreeNode *P = new TreeNode(0);
    // 在 n1 -> n2 中间插入节点 P
    n1->left = P;
    P->left = n2;
    cout << endl << "插入节点 P 后\n" << endl;
    printTree(n1);
    // 删除节点 P
    n1->left = n2;
    delete P; // 释放内存
    cout << endl << "删除节点 P 后\n" << endl;
    printTree(n1);

    // 释放内存
    freeMemoryTree(n1);

    return 0;
}
