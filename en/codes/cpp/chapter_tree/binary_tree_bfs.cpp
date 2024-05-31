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
    // Initialize a list to store the traversal sequence
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // Queue dequeues
        vec.push_back(node->val); // Save node value
        if (node->left != nullptr)
            queue.push(node->left); // Left child node enqueues
        if (node->right != nullptr)
            queue.push(node->right); // Right child node enqueues
    }
    return vec;
}

/* Driver Code */
int main() {
    /* Initialize binary tree */
    // Use a specific function to convert an array into a binary tree
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Initialize binary tree\n" << endl;
    printTree(root);

    /* Level-order traversal */
    vector<int> vec = levelOrder(root);
    cout << endl << "Sequence of nodes in level-order traversal = ";
    printVector(vec);

    return 0;
}
