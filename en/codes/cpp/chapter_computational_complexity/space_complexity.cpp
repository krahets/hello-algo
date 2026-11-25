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

/* Constant space */
void constant(int n) {
    // Constants, variables, and objects use O(1) space
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // Variables in the loop use O(1) space
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Function calls in the loop use O(1) space
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Linear space */
void linear(int n) {
    // An array of length n uses O(n) space
    vector<int> nums(n);
    // A list of length n uses O(n) space
    vector<ListNode> nodes;
    for (int i = 0; i < n; i++) {
        nodes.push_back(ListNode(i));
    }
    // A hash table with n entries uses O(n) space
    unordered_map<int, string> map;
    for (int i = 0; i < n; i++) {
        map[i] = to_string(i);
    }
}

/* Linear space (recursive) */
void linearRecur(int n) {
    cout << "Recursive call: n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Quadratic space */
void quadratic(int n) {
    // A two-dimensional list uses O(n^2) space
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* Quadratic space (recursive) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "Recursive call: n = " << n << " with length of nums = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* Exponential space (build a perfect binary tree) */
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
    // Constant space
    constant(n);
    // Linear space
    linear(n);
    linearRecur(n);
    // Quadratic space
    quadratic(n);
    quadraticRecur(n);
    // Exponential space
    TreeNode *root = buildTree(n);
    printTree(root);

    // Free the memory
    freeMemoryTree(root);

    return 0;
}
