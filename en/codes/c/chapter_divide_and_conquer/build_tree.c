/**
 * File : build_tree.c
 * Created Time: 2023-10-16
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

// Assume all elements less than 1000
#define MAX_SIZE 1000

/* Build binary tree: divide and conquer */
TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
    // Terminate when the subtree interval is empty
    if (r - l < 0)
        return NULL;
    // Initialize the root node
    TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
    root->val = preorder[i];
    root->left = NULL;
    root->right = NULL;
    // Query m to divide the left and right subtrees
    int m = inorderMap[preorder[i]];
    // Subproblem: build the left subtree
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
    // Subproblem: build the right subtree
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
    // Return the root node
    return root;
}

/* Build binary tree */
TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
    // Initialize hash map, storing the mapping from inorder elements to indices
    int *inorderMap = (int *)malloc(sizeof(int) * MAX_SIZE);
    for (int i = 0; i < inorderSize; i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorderSize - 1, inorderSize);
    free(inorderMap);
    return root;
}

/* Driver Code */
int main() {
    int preorder[] = {3, 9, 2, 1, 7};
    int inorder[] = {9, 3, 1, 2, 7};
    int preorderSize = sizeof(preorder) / sizeof(preorder[0]);
    int inorderSize = sizeof(inorder) / sizeof(inorder[0]);
    printf("Preorder traversal = ");
    printArray(preorder, preorderSize);
    printf("Inorder traversal = ");
    printArray(inorder, inorderSize);

    TreeNode *root = buildTree(preorder, preorderSize, inorder, inorderSize);
    printf("The constructed binary tree is:\n");
    printTree(root);

    freeMemoryTree(root);
    return 0;
}
