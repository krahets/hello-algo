/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 層序走訪 */
vector<int> levelOrder(TreeNode *root) {
    // 初始化佇列，加入根節點
    queue<TreeNode *> queue;
    queue.push(root);
    // 初始化一個串列，用於儲存走訪序列
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // 隊列出隊
        vec.push_back(node->val); // 儲存節點值
        if (node->left != nullptr)
            queue.push(node->left); // 左子節點入列
        if (node->right != nullptr)
            queue.push(node->right); // 右子節點入列
    }
    return vec;
}

/* Driver Code */
int main() {
    /* 初始化二元樹 */
    // 這裡藉助了一個從陣列直接生成二元樹的函式
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "初始化二元樹\n" << endl;
    printTree(root);

    /* 層序走訪 */
    vector<int> vec = levelOrder(root);
    cout << endl << "層序走訪的節點列印序列 = ";
    printVector(vec);

    return 0;
}
