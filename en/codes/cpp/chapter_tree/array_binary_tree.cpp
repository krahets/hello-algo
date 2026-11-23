/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary tree class using an array representation */
class ArrayBinaryTree {
  public:
    /* Constructor */
    ArrayBinaryTree(vector<int> arr) {
        tree = arr;
    }

    /* Number of positions in the array */
    int size() {
        return tree.size();
    }

    /* Get the value of the node at index i */
    int val(int i) {
        // If the index is out of bounds, return INT_MAX to represent an empty position
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* Get the left child index of the node at index i */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Get the right child index of the node at index i */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Get the parent index of the node at index i */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* Level-order traversal */
    vector<int> levelOrder() {
        vector<int> res;
        // Traverse the array directly
        for (int i = 0; i < size(); i++) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    /* Preorder traversal */
    vector<int> preOrder() {
        vector<int> res;
        dfs(0, "pre", res);
        return res;
    }

    /* Inorder traversal */
    vector<int> inOrder() {
        vector<int> res;
        dfs(0, "in", res);
        return res;
    }

    /* Postorder traversal */
    vector<int> postOrder() {
        vector<int> res;
        dfs(0, "post", res);
        return res;
    }

  private:
    vector<int> tree;

    /* Depth-first traversal */
    void dfs(int i, string order, vector<int> &res) {
        // Return if this position is empty
        if (val(i) == INT_MAX)
            return;
        // Preorder traversal
        if (order == "pre")
            res.push_back(val(i));
        dfs(left(i), order, res);
        // Inorder traversal
        if (order == "in")
            res.push_back(val(i));
        dfs(right(i), order, res);
        // Postorder traversal
        if (order == "post")
            res.push_back(val(i));
    }
};

/* Driver code */
int main() {
    // Initialize the binary tree
    // Use INT_MAX to represent an empty position (nullptr)
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\nInitialize the binary tree\n";
    cout << "Array representation of the binary tree:\n";
    printVector(arr);
    cout << "Linked representation of the binary tree:\n";
    printTree(root);

    // Binary tree class using an array representation
    ArrayBinaryTree abt(arr);

    // Access a node
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\nCurrent node index: " << i << ", value: " << abt.val(i) << "\n";
    cout << "Left child index: " << l << ", value: " << (abt.val(l) != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "Right child index: " << r << ", value: " << (abt.val(r) != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "Parent index: " << p << ", value: " << (abt.val(p) != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // Traverse the tree
    vector<int> res = abt.levelOrder();
    cout << "\nLevel-order traversal: ";
    printVector(res);
    res = abt.preOrder();
    cout << "Preorder traversal: ";
    printVector(res);
    res = abt.inOrder();
    cout << "Inorder traversal: ";
    printVector(res);
    res = abt.postOrder();
    cout << "Postorder traversal: ";
    printVector(res);

    return 0;
}
