/**
 * File: array_binary_tree.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Array-based binary tree structure */
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

/* List capacity */
int size(ArrayBinaryTree *abt) {
    return abt->size;
}

/* Get the value of the node at index i */
int val(ArrayBinaryTree *abt, int i) {
    // If index is out of bounds, return INT_MAX, representing a null
    if (i < 0 || i >= size(abt))
        return INT_MAX;
    return abt->tree[i];
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
int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    // Traverse array
    for (int i = 0; i < size(abt); i++) {
        if (val(abt, i) != INT_MAX)
            res[index++] = val(abt, i);
    }
    *returnSize = index;
    return res;
}

/* Depth-first traversal */
void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
    // If it is an empty spot, return
    if (val(abt, i) == INT_MAX)
        return;
    // Pre-order traversal
    if (strcmp(order, "pre") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, left(i), order, res, index);
    // In-order traversal
    if (strcmp(order, "in") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, right(i), order, res, index);
    // Post-order traversal
    if (strcmp(order, "post") == 0)
        res[(*index)++] = val(abt, i);
}

/* Pre-order traversal */
int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "pre", res, &index);
    *returnSize = index;
    return res;
}

/* In-order traversal */
int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "in", res, &index);
    *returnSize = index;
    return res;
}

/* Post-order traversal */
int *postOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "post", res, &index);
    *returnSize = index;
    return res;
}

/* Driver Code */
int main() {
    // Initialize binary tree
    // Use INT_MAX to represent null position NULL
    int arr[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    int arrSize = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrayToTree(arr, arrSize);
    printf("\nInitialize binary tree\n");
    printf("Binary tree in array representation:\n");
    printArray(arr, arrSize);
    printf("Binary tree in linked list representation:\n");
    printTree(root);

    ArrayBinaryTree *abt = newArrayBinaryTree(arr, arrSize);

    // Access node
    int i = 1;
    int l = left(i), r = right(i), p = parent(i);
    printf("\nCurrent node index = %d, value = %d\n", i, val(abt, i));
    printf("Its left child index = %d, value = %d\n", l, l < arrSize ? val(abt, l) : INT_MAX);
    printf("Its right child index = %d, value = %d\n", r, r < arrSize ? val(abt, r) : INT_MAX);
    printf("Its parent index = %d, value = %d\n", p, p < arrSize ? val(abt, p) : INT_MAX);

    // Traverse tree
    int returnSize;
    int *res;

    res = levelOrder(abt, &returnSize);
    printf("\nLevel-order traversal is:");
    printArray(res, returnSize);
    free(res);

    res = preOrder(abt, &returnSize);
    printf("Pre-order traversal is:");
    printArray(res, returnSize);
    free(res);

    res = inOrder(abt, &returnSize);
    printf("In-order traversal is:");
    printArray(res, returnSize);
    free(res);

    res = postOrder(abt, &returnSize);
    printf("Post-order traversal is:");
    printArray(res, returnSize);
    free(res);

    // Free memory
    delArrayBinaryTree(abt);
    return 0;
}
