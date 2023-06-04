/**
 * File: preorder_traversal_iii_compact.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 定义向量类型 */
typedef struct Vector {
    int size;     // 当前向量的大小
    int capacity; // 当前向量的容量
    void **data;  // 指向数据的指针数组
} Vector;

/* 初始化向量 */
void vectorInit(Vector *v) {
    v->size = 0;
    v->capacity = 4;
    v->data = malloc(v->capacity * sizeof(void *));
}

/*  添加元素到向量尾部 */
void vectorPushback(Vector *v, void *elem) {
    if (v->size == v->capacity) {
        v->capacity *= 2;
        v->data = realloc(v->data, v->capacity * sizeof(void *));
    }
    v->data[v->size++] = elem;
}

/* 从向量尾部弹出元素 */
void vectorPopback(Vector *v) {
    if (v->size != 0) {
        v->size--;
    }
}

/* 清空向量 */
void vectorClear(Vector *v) {
    for (int i = 0; i < v->size; i++) {
        free(v->data[i]);
    }
    free(v->data);
    v->size = 0;
    v->capacity = 4;
    v->data = malloc(v->capacity * sizeof(void *));
}

/* 前序遍历：例题三 */
void preOrder(TreeNode *root, Vector *path, Vector *res) {
    // 剪枝
    if (root == NULL || root->val == 3) {
        return;
    }
    // 尝试
    vectorPushback(path, root);
    if (root->val == 7) {
        // 记录解
        Vector *newPath = malloc(sizeof(Vector));
        vectorInit(newPath);
        for (int i = 0; i < path->size; i++) {
            vectorPushback(newPath, path->data[i]);
        }
        vectorPushback(res, newPath);
    }

    preOrder(root->left, path, res);
    preOrder(root->right, path, res);

    // 回退
    vectorPopback(path);
}

// 打印向量中的元素
void printResult(Vector *vv) {
    for (int i = 0; i < vv->size; i++) {
        Vector *v = (Vector *)vv->data[i];
        for (int j = 0; j < v->size; j++) {
            TreeNode *node = (TreeNode *)v->data[j];
            printf("%d ", node->val);
        }
        printf("\n");
    }
}

int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    int n = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrToTree(arr, n);
    printf("\r\n初始化二叉树\r\n");
    printTree(root);

    // 创建存储路径和结果的向量
    Vector path, res;
    vectorInit(&path);
    vectorInit(&res);

    // 前序遍历
    preOrder(root, &path, &res);

    // 输出结果
    printf("输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点:\n");
    printResult(&res);

    // 释放内存

    return 0;
}
