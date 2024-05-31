/**
 * File: space_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Function */
int func() {
    // Perform some operations
    return 0;
}

/* Constant complexity */
void constant(int n) {
    // Constants, variables, objects occupy O(1) space
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // Variables in a loop occupy O(1) space
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Functions in a loop occupy O(1) space
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Linear complexity */
void linear(int n) {
    // Array of length n occupies O(n) space
    vector<int> nums(n);
    // A list of length n occupies O(n) space
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // A hash table of length n occupies O(n) space
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* Linear complexity (recursive implementation) */
void linearRecur(int n) {
    cout << "Recursion n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Quadratic complexity */
void quadratic(int n) {
    // A two-dimensional list occupies O(n^2) space
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* Quadratic complexity (recursive implementation) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "Recursive n = " << n << ", length of nums = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* Exponential complexity (building a full binary tree) */
TreeNode *buildTree(int n) {
    if (n == 0)
        return nullptr;
    TreeNode *root = new TreeNode(0);
    root->left = buildTree(n - 1);
    root->right = buildTree(n - 1);
    return root;
}

/* Driver Code */
int main() {
    int n = 5;
    // Constant complexity
    constant(n);
    // Linear complexity
    linear(n);
    linearRecur(n);
    // Quadratic complexity
    quadratic(n);
    quadraticRecur(n);
    // Exponential complexity
    TreeNode *root = buildTree(n);
    printTree(root);

    // Free memory
    freeMemoryTree(root);

    return 0;
}
