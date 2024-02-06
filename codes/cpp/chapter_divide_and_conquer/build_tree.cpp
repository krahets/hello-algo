/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 构建二叉树：分治 */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // 子树区间为空时终止
    if (r - l < 0)
        return NULL;
    // 初始化根节点
    TreeNode *root = new TreeNode(preorder[i]);
    // 查询 m ，从而划分左右子树
    int m = inorderMap[preorder[i]];
    // 子问题：构建左子树
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 子问题：构建右子树
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 返回根节点
    return root;
}

/* 构建二叉树 */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // 初始化哈希表，存储 inorder 元素到索引的映射
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* Driver Code */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "前序遍历 = ";
    printVector(preorder);
    cout << "中序遍历 = ";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "构建的二叉树为：\n";
    printTree(root);

    return 0;
}
