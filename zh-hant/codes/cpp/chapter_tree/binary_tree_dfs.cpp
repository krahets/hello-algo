/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// 初始化串列以儲存走訪序列
vector<int> vec;

/* 前序走訪 */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 走訪順序：根節點 -> 左子樹 -> 右子樹
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* 中序走訪 */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 走訪順序：左子樹 -> 根節點 -> 右子樹
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* 後序走訪 */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 走訪順序：左子樹 -> 右子樹 -> 根節點
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* 主程式 */
int main() {
    /* 初始化二元樹 */
    // 這裡使用能從陣列直接建立二元樹的函式
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "初始化二元樹\n" << endl;
    printTree(root);

    /* 前序走訪 */
    vec.clear();
    preOrder(root);
    cout << endl << "依前序走訪印出的節點序列 = ";
    printVector(vec);

    /* 中序走訪 */
    vec.clear();
    inOrder(root);
    cout << endl << "依中序走訪印出的節點序列 = ";
    printVector(vec);

    /* 後序走訪 */
    vec.clear();
    postOrder(root);
    cout << endl << "依後序走訪印出的節點序列 = ";
    printVector(vec);

    return 0;
}
