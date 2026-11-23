/**
 * File: array_binary_tree.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Binary tree structure represented by an array */
typedef struct {
    int *tree;
    int size;
} ArrayBinaryTree;

/* Constructor */
ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
    ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
    abt->tree = malloc(sizeof(int) * arrSize);
    memcpy(abt->tree, arr, sizeof(int) * arrSize);
    abt->size = arrSize;
    return abt;
}

/* Destructor */
void delArrayBinaryTree(ArrayBinaryTree *abt) {
    free(abt->tree);
    free(abt);
}

/* Array length */
int size(ArrayBinaryTree *abt) {
    return abt->size;
}

/* Get the value of the node at index i */
int val(ArrayBinaryTree *abt, int i) {
    // If the index is out of bounds, return INT_MAX to represent an empty position
    if (i < 0 || i >= size(abt))
        return INT_MAX;
    return abt->tree[i];
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
int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    // Traverse the array directly
    for (int i = 0; i < size(abt); i++) {
        if (val(abt, i) != INT_MAX)
            res[index++] = val(abt, i);
    }
    *returnSize = index;
    return res;
}

/* Depth-first traversal */
void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
    // Return if this position is empty
    if (val(abt, i) == INT_MAX)
        return;
    // Preorder traversal
    if (strcmp(order, "pre") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, left(i), order, res, index);
    // Inorder traversal
    if (strcmp(order, "in") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, right(i), order, res, index);
    // Postorder traversal
    if (strcmp(order, "post") == 0)
        res[(*index)++] = val(abt, i);
}

/* Preorder traversal */
int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "pre", res, &index);
    *returnSize = index;
    return res;
}

/* Inorder traversal */
int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "in", res, &index);
    *returnSize = index;
    return res;
}

/* Postorder traversal */
int *postOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "post", res, &index);
    *returnSize = index;
    return res;
}

/* Driver code */
int main() {
    // Initialize the binary tree
    // Use INT_MAX to represent an empty position (NULL)
    int arr[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    int arrSize = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrayToTree(arr, arrSize);
    printf("\nInitialize the binary tree\n");
    printf("Array representation of the binary tree:\n");
    printArray(arr, arrSize);
    printf("Linked representation of the binary tree:\n");
    printTree(root);

    ArrayBinaryTree *abt = newArrayBinaryTree(arr, arrSize);

    // Access a node
    int i = 1;
    int l = left(i), r = right(i), p = parent(i);
    printf("\nCurrent node: index %d, value %d\n", i, val(abt, i));
    printf("Its left child: index %d, value %d\n", l, l < arrSize ? val(abt, l) : INT_MAX);
    printf("Its right child: index %d, value %d\n", r, r < arrSize ? val(abt, r) : INT_MAX);
    printf("Its parent: index %d, value %d\n", p, p < arrSize ? val(abt, p) : INT_MAX);

    // Traverse the tree
    int returnSize;
    int *res;

    res = levelOrder(abt, &returnSize);
    printf("\nLevel-order traversal: ");
    printArray(res, returnSize);
    free(res);

    res = preOrder(abt, &returnSize);
    printf("Preorder traversal: ");
    printArray(res, returnSize);
    free(res);

    res = inOrder(abt, &returnSize);
    printf("Inorder traversal: ");
    printArray(res, returnSize);
    free(res);

    res = postOrder(abt, &returnSize);
    printf("Postorder traversal: ");
    printArray(res, returnSize);
    free(res);

    // Free memory
    delArrayBinaryTree(abt);
    return 0;
}
