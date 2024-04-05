/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// 初始化串列，用於儲存走訪序列
vector<int> vec;

/* 前序走訪 */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 訪問優先順序：根節點 -> 左子樹 -> 右子樹
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* 中序走訪 */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 訪問優先順序：左子樹 -> 根節點 -> 右子樹
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* 後序走訪 */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 訪問優先順序：左子樹 -> 右子樹 -> 根節點
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* Driver Code */
int main() {
    /* 初始化二元樹 */
    // 這裡藉助了一個從陣列直接生成二元樹的函式
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "初始化二元樹\n" << endl;
    printTree(root);

    /* 前序走訪 */
    vec.clear();
    preOrder(root);
    cout << endl << "前序走訪的節點列印序列 = ";
    printVector(vec);

    /* 中序走訪 */
    vec.clear();
    inOrder(root);
    cout << endl << "中序走訪的節點列印序列 = ";
    printVector(vec);

    /* 後序走訪 */
    vec.clear();
    postOrder(root);
    cout << endl << "後序走訪的節點列印序列 = ";
    printVector(vec);

    return 0;
}
