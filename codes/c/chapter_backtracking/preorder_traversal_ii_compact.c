/**
 * File: preorder_traversal_ii_compact.c
 * Created Time: 2023-05-28
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 前序遍历：例题二 */
void preOrder(TreeNode *root, vector *path, vector *res) {
    if (root == NULL) {
        return;
    }
    // 尝试
    vectorPushback(path, root, sizeof(TreeNode));
    if (root->val == 7) {
        // 记录解
        vector *newPath = newVector();
        for (int i = 0; i < path->size; i++) {
            vectorPushback(newPath, path->data[i], sizeof(int));
        }
        vectorPushback(res, newPath, sizeof(vector));
    }

    preOrder(root->left, path, res);
    preOrder(root->right, path, res);

    // 回退
    vectorPopback(path);
}

// 打印向量中的元素
void printResult(vector *vv) {
    for (int i = 0; i < vv->size; i++) {
        vector *v = (vector *)vv->data[i];
        for (int j = 0; j < v->size; j++) {
            TreeNode *node = (TreeNode *)v->data[j];
            printf("%d ", node->val);
        }
        printf("\n");
    }
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    int n = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrToTree(arr, n);
    printf("\r\n初始化二叉树\r\n");
    printTree(root);

    // 创建存储路径和结果的向量
    vector *path = newVector();
    vector *res = newVector();

    // 前序遍历
    preOrder(root, path, res);

    // 输出结果
    printf("输出所有根节点到节点 7 的路径:\n");
    printResult(res);

    // 释放内存
    delVector(path);
    delVector(res);
    return 0;
}
