/**
 * File: build_tree.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <unordered_map>
using namespace std;

// 二叉树节点结构体
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};

/* 构建二叉树：分治 */
TreeNode *dfs(vector<int> &preorder, unordered_map<int, int> &inorderMap, int i, int l, int r) {
    // 子树区间为空时终止
    if (l > r)
        return nullptr;

    // 初始化根节点
    TreeNode *root = new TreeNode(preorder[i]);

    // 查询 m，划分左右子树
    int m = inorderMap[preorder[i]];

    // 子问题：构建左子树
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1);

    // 子问题：构建右子树
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);

    return root;
}

/* 前序+中序 构建二叉树 */
TreeNode *buildTree(vector<int> &preorder, vector<int> &inorder) {
    unordered_map<int, int> inorderMap;
    for (int i = 0; i < inorder.size(); ++i) {
        inorderMap[inorder[i]] = i;
    }
    return dfs(preorder, inorderMap, 0, 0, inorder.size() - 1);
}

/* 打印数组 */
void printVector(vector<int> &vec) {
    cout << "[ ";
    for (int num : vec) {
        cout << num << " ";
    }
    cout << "]\n";
}

/* 美观打印二叉树（快速直观版） */
void printTree(TreeNode *root) {
    if (!root) return;
    cout << root->val;
    if (root->left || root->right) {
        cout << " ——> ";
        if (root->left) cout << "L:" << root->left->val;
        if (root->right) cout << "  R:" << root->right->val;
        cout << "\n";
        printTree(root->left);
        printTree(root->right);
    }
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
    cout << "\n构建的二叉树结构：\n";
    printTree(root);

    return 0;
}
