/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Level-order traversal */
vector<int> levelOrder(TreeNode *root) {
    // Initialize a queue and enqueue the root
    queue<TreeNode *> queue;
    queue.push(root);
    // Initialize a list to store the traversal sequence
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // Dequeue from the queue
        vec.push_back(node->val); // Store the node value
        if (node->left != nullptr)
            queue.push(node->left); // Enqueue the left child
        if (node->right != nullptr)
            queue.push(node->right); // Enqueue the right child
    }
    return vec;
}

/* Driver code */
int main() {
    /* Initialize the binary tree */
    // Use a helper function that builds a binary tree directly from an array
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "Initialize the binary tree\n" << endl;
    printTree(root);

    /* Level-order traversal */
    vector<int> vec = levelOrder(root);
    cout << endl << "Node sequence from level-order traversal = ";
    printVector(vec);

    return 0;
}
