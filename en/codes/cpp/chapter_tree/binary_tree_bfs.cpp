/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Level-order traversal */
vector<int> levelOrder(TreeNode *root) {
    // Initialize queue, add root node
    queue<TreeNode *> queue;
    queue.push(root);
    // Initialize a list to save the traversal sequence
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // Dequeue
        vec.push_back(node->val); // Save node value
        if (node->left != nullptr)
            queue.push(node->left); // Left child node enqueue
        if (node->right != nullptr)
            queue.push(node->right); // Right child node enqueue
    }
    return vec;
}

/* Driver Code */
int main() {
    /* Initialize binary tree */
    // Here we use a function to generate a binary tree directly from an array
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Initialize binary tree\n" << endl;
    printTree(root);

    /* Level-order traversal */
    vector<int> vec = levelOrder(root);
    cout << endl << "Level-order traversal node print sequence = ";
    printVector(vec);

    return 0;
}
