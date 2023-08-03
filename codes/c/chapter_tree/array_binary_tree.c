/**
 * File: array_binary_tree.c
 * Created Time: 2023-07-29
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 数组表示下的二叉树类 */
struct arrayBinaryTree {
    vector *tree;
};

typedef struct arrayBinaryTree arrayBinaryTree;

/* 构造函数 */
arrayBinaryTree *newArrayBinaryTree(vector *arr) {
    arrayBinaryTree *newABT = malloc(sizeof(arrayBinaryTree));
    newABT->tree = arr;
    return newABT;
}

/* 节点数量 */
int size(arrayBinaryTree *abt) {
    return abt->tree->size;
}

/* 获取索引为 i 节点的值 */
int val(arrayBinaryTree *abt, int i) {
    // 若索引越界，则返回 INT_MAX ，代表空位
    if (i < 0 || i >= size(abt))
        return INT_MAX;
    return *(int *)abt->tree->data[i];
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

/* 深度优先遍历 */
void dfs(arrayBinaryTree *abt, int i, const char *order, vector *res) {
    // 若为空位，则返回
    if (val(abt, i) == INT_MAX)
        return;
    // 前序遍历
    if (strcmp(order, "pre") == 0) {
        int tmp = val(abt, i);
        vectorPushback(res, &tmp, sizeof(tmp));
    }
    dfs(abt, left(i), order, res);
    // 中序遍历
    if (strcmp(order, "in") == 0) {
        int tmp = val(abt, i);
        vectorPushback(res, &tmp, sizeof(tmp));
    }
    dfs(abt, right(i), order, res);
    // 后序遍历
    if (strcmp(order, "post") == 0) {
        int tmp = val(abt, i);
        vectorPushback(res, &tmp, sizeof(tmp));
    }
}

/* 层序遍历 */
vector *levelOrder(arrayBinaryTree *abt) {
    vector *res = newVector();
    // 直接遍历数组
    for (int i = 0; i < size(abt); i++) {
        if (val(abt, i) != INT_MAX) {
            int tmp = val(abt, i);
            vectorPushback(res, &tmp, sizeof(int));
        }
    }
    return res;
}

/* 前序遍历 */
vector *preOrder(arrayBinaryTree *abt) {
    vector *res = newVector();
    dfs(abt, 0, "pre", res);
    return res;
}

/* 中序遍历 */
vector *inOrder(arrayBinaryTree *abt) {
    vector *res = newVector();
    dfs(abt, 0, "in", res);
    return res;
}

/* 后序遍历 */
vector *postOrder(arrayBinaryTree *abt) {
    vector *res = newVector();
    dfs(abt, 0, "post", res);
    return res;
}

/* 打印向量中的元素 */
void printFunc(vector *v, void *p) {
    int *val = p;
    printf("%d", *val);
}

/* Driver Code */
int main() {
    // 初始化二叉树
    // 使用 INT_MAX 代表空位 nullptr
    int arr[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = arrToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n初始化二叉树\n");
    printf("二叉树的数组表示：\n");
    printArray(arr, sizeof(arr) / sizeof(arr[0]));
    printf("二叉树的链表表示：\n");
    printTree(root);

    vector *vArr = newVector();
    for (int i = 0; i < sizeof(arr) / sizeof(arr[0]); i++) {
        vectorPushback(vArr, &arr[i], sizeof(int));
    }
    // 数组表示下的二叉树类
    arrayBinaryTree *abt = newArrayBinaryTree(vArr);

    // 访问节点
    int i = 1;
    int l = left(i), r = right(i), p = parent(i);
    printf("\n当前节点的索引为 %d，值为 %d\n", i, val(abt, i));
    printf("其左子节点的索引为 %d，值为 %d\r\n", l, val(abt, l));
    printf("其右子节点的索引为 %d，值为 %d\r\n", r, val(abt, r));
    printf("其父节点的索引为 %d，值为 %d\r\n", p, val(abt, p));

    // 遍历树
    vector *res = levelOrder(abt);
    printf("\n层序遍历为： ");
    printVector(res, printFunc);
    delVector(res);
    res = preOrder(abt);
    printf("前序遍历为： ");
    printVector(res, printFunc);
    delVector(res);
    res = inOrder(abt);
    printf("中序遍历为： ");
    printVector(res, printFunc);
    delVector(res);
    res = postOrder(abt);
    printf("后序遍历为： ");
    printVector(res, printFunc);
    delVector(res);

    return 0;
}