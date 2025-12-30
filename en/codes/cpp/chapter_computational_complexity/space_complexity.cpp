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

/* Constant order */
void constant(int n) {
    // Constants, variables, objects occupy O(1) space
    const int a = 0;
    int b = 0;
    vector<int> nums(10000);
    ListNode node(0);
    // Variables in the loop occupy O(1) space
    for (int i = 0; i < n; i++) {
        int c = 0;
    }
    // Functions in the loop occupy O(1) space
    for (int i = 0; i < n; i++) {
        func();
    }
}

/* Linear order */
void linear(int n) {
    // Array of length n uses O(n) space
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

/* Linear order (recursive implementation) */
void linearRecur(int n) {
    cout << "Recursion n = " << n << endl;
    if (n == 1)
        return;
    linearRecur(n - 1);
}

/* Exponential order */
void quadratic(int n) {
    // 2D list uses O(n^2) space
    vector<vector<int>> numMatrix;
    for (int i = 0; i < n; i++) {
        vector<int> tmp;
        for (int j = 0; j < n; j++) {
            tmp.push_back(0);
        }
        numMatrix.push_back(tmp);
    }
}

/* Quadratic order (recursive implementation) */
int quadraticRecur(int n) {
    if (n <= 0)
        return 0;
    vector<int> nums(n);
    cout << "In recursion n = " << n << ", nums length = " << nums.size() << endl;
    return quadraticRecur(n - 1);
}

/* Driver Code */
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
    // Constant order
    constant(n);
    // Linear order
    linear(n);
    linearRecur(n);
    // Exponential order
    quadratic(n);
    quadraticRecur(n);
    // Exponential order
    TreeNode *root = buildTree(n);
    printTree(root);

    // Free memory
    freeMemoryTree(root);

    return 0;
}
