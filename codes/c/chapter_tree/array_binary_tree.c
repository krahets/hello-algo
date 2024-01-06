/**
 * File: array_binary_tree.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 数组表示下的二叉树结构体 */
typedef struct {
    int *tree;
    int size;
} ArrayBinaryTree;

/* 构造函数 */
ArrayBinaryTree *newArrayBinaryTree(int *arr, int arrSize) {
    ArrayBinaryTree *abt = (ArrayBinaryTree *)malloc(sizeof(ArrayBinaryTree));
    abt->tree = malloc(sizeof(int) * arrSize);
    memcpy(abt->tree, arr, sizeof(int) * arrSize);
    abt->size = arrSize;
    return abt;
}

/* 析构函数 */
void delArrayBinaryTree(ArrayBinaryTree *abt) {
    free(abt->tree);
    free(abt);
}

/* 列表容量 */
int size(ArrayBinaryTree *abt) {
    return abt->size;
}

/* 获取索引为 i 节点的值 */
int val(ArrayBinaryTree *abt, int i) {
    // 若索引越界，则返回 INT_MAX ，代表空位
    if (i < 0 || i >= size(abt))
        return INT_MAX;
    return abt->tree[i];
}

/* 获取索引为 i 节点的左子节点的索引 */
int left(int i) {
    return 2 * i + 1;
}

/* 获取索引为 i 节点的右子节点的索引 */
int right(int i) {
    return 2 * i + 2;
}

/* 获取索引为 i 节点的父节点的索引 */
int parent(int i) {
    return (i - 1) / 2;
}

/* 层序遍历 */
int *levelOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    // 直接遍历数组
    for (int i = 0; i < size(abt); i++) {
        if (val(abt, i) != INT_MAX)
            res[index++] = val(abt, i);
    }
    *returnSize = index;
    return res;
}

/* 深度优先遍历 */
void dfs(ArrayBinaryTree *abt, int i, char *order, int *res, int *index) {
    // 若为空位，则返回
    if (val(abt, i) == INT_MAX)
        return;
    // 前序遍历
    if (strcmp(order, "pre") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, left(i), order, res, index);
    // 中序遍历
    if (strcmp(order, "in") == 0)
        res[(*index)++] = val(abt, i);
    dfs(abt, right(i), order, res, index);
    // 后序遍历
    if (strcmp(order, "post") == 0)
        res[(*index)++] = val(abt, i);
}

/* 前序遍历 */
int *preOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "pre", res, &index);
    *returnSize = index;
    return res;
}

/* 中序遍历 */
int *inOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "in", res, &index);
    *returnSize = index;
    return res;
}

/* 后序遍历 */
int *postOrder(ArrayBinaryTree *abt, int *returnSize) {
    int *res = (int *)malloc(sizeof(int) * size(abt));
    int index = 0;
    dfs(abt, 0, "post", res, &index);
    *returnSize = index;
    return res;
}

/* Driver Code */
int main() {
    // 初始化二叉树
    // 使用 INT_MAX 代表空位 NULL
    int arr[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    int arrSize = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrayToTree(arr, arrSize);
    printf("\n初始化二叉树\n");
    printf("二叉树的数组表示：\n");
    printArray(arr, arrSize);
    printf("二叉树的链表表示：\n");
    printTree(root);

    ArrayBinaryTree *abt = newArrayBinaryTree(arr, arrSize);

    // 访问节点
    int i = 1;
    int l = left(i), r = right(i), p = parent(i);
    printf("\n当前节点的索引为 %d，值为 %d\n", i, val(abt, i));
    printf("其左子节点的索引为 %d，值为 %d\n", l, l < arrSize ? val(abt, l) : INT_MAX);
    printf("其右子节点的索引为 %d，值为 %d\n", r, r < arrSize ? val(abt, r) : INT_MAX);
    printf("其父节点的索引为 %d，值为 %d\n", p, p < arrSize ? val(abt, p) : INT_MAX);

    // 遍历树
    int returnSize;
    int *res;

    res = levelOrder(abt, &returnSize);
    printf("\n层序遍历为： ");
    printArray(res, returnSize);
    free(res);

    res = preOrder(abt, &returnSize);
    printf("前序遍历为： ");
    printArray(res, returnSize);
    free(res);

    res = inOrder(abt, &returnSize);
    printf("中序遍历为： ");
    printArray(res, returnSize);
    free(res);

    res = postOrder(abt, &returnSize);
    printf("后序遍历为： ");
    printArray(res, returnSize);
    free(res);

    // 释放内存
    delArrayBinaryTree(abt);
    return 0;
}
