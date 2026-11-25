/**
 * File: build_tree.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 建構二元樹：分治法 */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // 子樹區間為空時終止
    if (r - l < 0)
        return NULL;
    // 初始化根節點
    TreeNode *root = new TreeNode(preorder[i]);
    // 查出 m，據此劃分左右子樹
    int m = inorderMap[preorder[i]];
    // 子問題：建構左子樹
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);
    // 子問題：建構右子樹
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
    // 回傳根節點
    return root;
}

/* 建構二元樹 */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    // 初始化雜湊表，記錄 inorder 中各元素對應的索引
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
    return root;
}

/* 主程式 */
int main() {
    vector<int> preorder = {3, 9, 2, 1, 7};
    vector<int> inorder = {9, 3, 1, 2, 7};
    cout << "前序走訪 = ";
    printVector(preorder);
    cout << "中序走訪 = ";
    printVector(inorder);

    TreeNode *root = buildTree(preorder, inorder);
    cout << "建構出的二元樹為：\n";
    printTree(root);

    return 0;
}
