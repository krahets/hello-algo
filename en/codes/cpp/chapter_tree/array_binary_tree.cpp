/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Array-based binary tree class */
class ArrayBinaryTree {
  public:
    /* Constructor */
    ArrayBinaryTree(vector<int> arr) {
        tree = arr;
    }

    /* List capacity */
    int size() {
        return tree.size();
    }

    /* Get the value of the node at index i */
    int val(int i) {
        // If index is out of bounds, return INT_MAX, representing a null
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* Get the index of the left child of the node at index i */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Get the index of the right child of the node at index i */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Get the index of the parent of the node at index i */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* Level-order traversal */
    vector<int> levelOrder() {
        vector<int> res;
        // Traverse array
        for (int i = 0; i < size(); i++) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    /* Pre-order traversal */
    vector<int> preOrder() {
        vector<int> res;
        dfs(0, "pre", res);
        return res;
    }

    /* In-order traversal */
    vector<int> inOrder() {
        vector<int> res;
        dfs(0, "in", res);
        return res;
    }

    /* Post-order traversal */
    vector<int> postOrder() {
        vector<int> res;
        dfs(0, "post", res);
        return res;
    }

  private:
    vector<int> tree;

    /* Depth-first traversal */
    void dfs(int i, string order, vector<int> &res) {
        // If it is an empty spot, return
        if (val(i) == INT_MAX)
            return;
        // Pre-order traversal
        if (order == "pre")
            res.push_back(val(i));
        dfs(left(i), order, res);
        // In-order traversal
        if (order == "in")
            res.push_back(val(i));
        dfs(right(i), order, res);
        // Post-order traversal
        if (order == "post")
            res.push_back(val(i));
    }
};

/* Driver Code */
int main() {
    // Initialize binary tree
    // Use INT_MAX to represent an empty spot nullptr
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\nInitialize binary tree\n";
    cout << "Binary tree in array representation:\n";
    printVector(arr);
    cout << "Binary tree in linked list representation:\n";
    printTree(root);

    // Array-based binary tree class
    ArrayBinaryTree abt(arr);

    // Access node
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\nCurrent node's index is " << i << ", value = " << abt.val(i) << "\n";
    cout << "Its left child's index is " << l << ", value = " << (l != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "Its right child's index is " << r << ", value = " << (r != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "Its parent's index is " << p << ", value = " << (p != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // Traverse tree
    vector<int> res = abt.levelOrder();
    cout << "\nLevel-order traversal is:";
    printVector(res);
    res = abt.preOrder();
    cout << "Pre-order traversal is:";
    printVector(res);
    res = abt.inOrder();
    cout << "In-order traversal is:";
    printVector(res);
    res = abt.postOrder();
    cout << "Post-order traversal is:";
    printVector(res);

    return 0;
}
