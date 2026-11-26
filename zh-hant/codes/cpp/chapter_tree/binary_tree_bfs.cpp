/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 層序走訪 */
vector<int> levelOrder(TreeNode *root) {
    // 初始化佇列並加入根節點
    queue<TreeNode *> queue;
    queue.push(root);
    // 初始化一個串列，用來儲存走訪序列
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // 從佇列前端取出節點
        vec.push_back(node->val); // 儲存節點值
        if (node->left != nullptr)
            queue.push(node->left); // 將左子節點加入佇列
        if (node->right != nullptr)
            queue.push(node->right); // 將右子節點加入佇列
    }
    return vec;
}

/* 主程式 */
int main() {
    /* 初始化二元樹 */
    // 這裡使用能從陣列直接建立二元樹的函式
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "初始化二元樹\n" << endl;
    printTree(root);

    /* 層序走訪 */
    vector<int> vec = levelOrder(root);
    cout << endl << "依層序走訪印出的節點序列 = ";
    printVector(vec);

    return 0;
}
