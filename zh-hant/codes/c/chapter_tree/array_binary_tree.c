/**
 * File: array_binary_tree.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 陣列表示下的二元樹結構體 */
typedef struct {
    int *tree;
    int size;
} ArrayBinaryTree;

/* 建構子 */
ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
    ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
    abt->tree = malloc(sizeof(int) * arrSize);
    memcpy(abt->tree, arr, sizeof(int) * arrSize);
    abt->size = arrSize;
    return abt;
}

/* 析構函式 */
void delArrayBinaryTree(ArrayBinaryTree *abt) {
    free(abt->tree);
    free(abt);
}

/* 串列容量 */
int size(ArrayBinaryTree *abt) {
    return abt->size;
}

/* 獲取索引為 i 節點的值 */
int val(ArrayBinaryTree *abt, int i) {
    // 若索引越界，則返回 INT_MAX ，代表空位
    if (i < 0 || i >= size(abt))
        return INT_MAX;
    return abt->tree[i];
}

/* 獲取索引為 i 節點的左子節點的索引 */
int left(int i) {
    return 2 * i + 1;
}

/* 獲取索引為 i 節點的右子節點的索引 */
int right(int i) {
    return 2 * i + 2;
}

/* 獲取索引為 i 節點的父節點的索引 */
int parent(int i) {
    return (i - 1) / 2;
}

/* 層序走訪 */
int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    // 直接走訪陣列
    for (int i = 0; i < size(abt); i++) {
        if (val(abt, i) != INT_MAX)
            res[index++] = val(abt, i);
    }
    *returnSize = index;
    return res;
}

/* 深度優先走訪 */
void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
    // 若為空位，則返回
    if (val(abt, i) == INT_MAX)
        return;
    // 前序走訪
    if (strcmp(order, "pre") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, left(i), order, res, index);
    // 中序走訪
    if (strcmp(order, "in") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, right(i), order, res, index);
    // 後序走訪
    if (strcmp(order, "post") == 0)
        res[(*index)++] = val(abt, i);
}

/* 前序走訪 */
int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "pre", res, &index);
    *returnSize = index;
    return res;
}

/* 中序走訪 */
int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "in", res, &index);
    *returnSize = index;
    return res;
}

/* 後序走訪 */
int *postOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "post", res, &index);
    *returnSize = index;
    return res;
}

/* Driver Code */
int main() {
    // 初始化二元樹
    // 使用 INT_MAX 代表空位 NULL
    int arr[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    int arrSize = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrayToTree(arr, arrSize);
    printf("\n初始化二元樹\n");
    printf("二元樹的陣列表示：\n");
    printArray(arr, arrSize);
    printf("二元樹的鏈結串列表示：\n");
    printTree(root);

    ArrayBinaryTree *abt = newArrayBinaryTree(arr, arrSize);

    // 訪問節點
    int i = 1;
    int l = left(i), r = right(i), p = parent(i);
    printf("\n當前節點的索引為 %d，值為 %d\n", i, val(abt, i));
    printf("其左子節點的索引為 %d，值為 %d\n", l, l < arrSize ? val(abt, l) : INT_MAX);
    printf("其右子節點的索引為 %d，值為 %d\n", r, r < arrSize ? val(abt, r) : INT_MAX);
    printf("其父節點的索引為 %d，值為 %d\n", p, p < arrSize ? val(abt, p) : INT_MAX);

    // 走訪樹
    int returnSize;
    int *res;

    res = levelOrder(abt, &returnSize);
    printf("\n層序走訪為： ");
    printArray(res, returnSize);
    free(res);

    res = preOrder(abt, &returnSize);
    printf("前序走訪為： ");
    printArray(res, returnSize);
    free(res);

    res = inOrder(abt, &returnSize);
    printf("中序走訪為： ");
    printArray(res, returnSize);
    free(res);

    res = postOrder(abt, &returnSize);
    printf("後序走訪為： ");
    printArray(res, returnSize);
    free(res);

    // 釋放記憶體
    delArrayBinaryTree(abt);
    return 0;
}
