/**
 * File: preorder_traversal_i_compact.c
 * Created Time: 2023-05-10
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

#define MaxLength 1024

/* TreeNode 动态数组简单实现 */
struct myArray {
    TreeNode *(data[MaxLength]);
    int size;
};

typedef struct myArray myArray;

myArray *newArray() {
    myArray *array = malloc(sizeof(myArray));
    array->size = 0;
}

void delArray(myArray *array) {
    if (array) {
        for (int i = 0; i < array->size && array->data[i]; ++i) {
            free(array->data[i]);
        }

        array->size = 0;
        free(array);
    }
}

void push_back(myArray *array, TreeNode *newNode) {
    if (array) {
        if (array->data)
            array->data[array->size] = newNode;
        array->size++;
    }
}

void printMyArray(myArray *array) {
    printf("[");
    for (int i = 0; i < array->size && array->data[i]; ++i) {
        printf("%d", array->data[i]->val);
        if (i == array->size - 1) {
            printf("]");
        } else {
            printf(", ");
        }
    }
}

myArray *res;

/* 前序遍历：例题一 */
static void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    if (root->val == 7) {
        // 记录解
        push_back(res, root);
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    res = newArray();
    TreeNode *root = arrToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n初始化二叉树\r\n");
    printTree(root);

    // 前序遍历
    preOrder(root);

    printf("\n输出所有值为 7 的节点\r\n");
    printMyArray(res);

    delArray(res);
}