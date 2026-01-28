/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary tree class represented by array */
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

    /* Get value of node at index i */
    int val(int i) {
        // Return INT_MAX if index out of bounds, representing empty position
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* Get index of left child node of node at index i */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Get index of right child node of node at index i */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Get index of parent node of node at index i */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* Level-order traversal */
    vector<int> levelOrder() {
        vector<int> res;
        // Traverse array directly
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
        // If empty position, return
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

/* Driver Code */
int main() {
    // Initialize binary tree
    // Use INT_MAX to represent empty position nullptr
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\nInitialize binary tree\n";
    cout << "Array representation of binary tree:\n";
    printVector(arr);
    cout << "Linked list representation of binary tree:\n";
    printTree(root);

    // Binary tree class represented by array
    ArrayBinaryTree abt(arr);

    // Access node
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\nCurrent node index is " << i << ", value is " << abt.val(i) << "\n";
    cout << "Its left child node index is " << l << ", value is " << (abt.val(l) != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "Its right child node index is " << r << ", value is " << (abt.val(r) != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "Its parent node index is " << p << ", value is " << (abt.val(p) != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // Traverse tree
    vector<int> res = abt.levelOrder();
    cout << "\nLevel-order traversal: ";
    printVector(res);
    res = abt.preOrder();
    cout << "Pre-order traversal: ";
    printVector(res);
    res = abt.inOrder();
    cout << "In-order traversal: ";
    printVector(res);
    res = abt.postOrder();
    cout << "Post-order traversal: ";
    printVector(res);

    return 0;
}
