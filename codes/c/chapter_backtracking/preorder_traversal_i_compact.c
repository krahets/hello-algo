/**
 * File: preorder_traversal_i_compact.c
 * Created Time: 2023-05-10
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

vector *res;

// 打印向量中的元素
void printFunc(vector *v, void *p) {
    TreeNode *node = p;
    printf("%d ", node->val);
}

/* 前序遍历：例题一 */
static void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    if (root->val == 7) {
        // 记录解
        vectorPushback(res, root, sizeof(int));
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    res = newVector();
    TreeNode *root = arrToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n初始化二叉树\r\n");
    printTree(root);

    // 前序遍历
    preOrder(root);

    printf("\n输出所有值为 7 的节点\r\n");
    printVector(res, printFunc);
    delVector(res);
}