/**
 * File: print_util.h
 * Created Time: 2022-12-21
 * Author: MolDum (moldum@163.com), Reanon (793584285@qq.com)
 */

#ifndef PRINT_UTIL_H
#define PRINT_UTIL_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "list_node.h"
#include "tree_node.h"

#ifdef __cplusplus
extern "C" {
#endif

/* 印出陣列 */
void printArray(int arr[], int size) {
    if (arr == NULL || size == 0) {
        printf("[]");
        return;
    }
    printf("[");
    for (int i = 0; i < size - 1; i++) {
        printf("%d, ", arr[i]);
    }
    printf("%d]\n", arr[size - 1]);
}

/* 印出陣列 */
void printArrayFloat(float arr[], int size) {
    if (arr == NULL || size == 0) {
        printf("[]");
        return;
    }
    printf("[");
    for (int i = 0; i < size - 1; i++) {
        printf("%.2f, ", arr[i]);
    }
    printf("%.2f]\n", arr[size - 1]);
}

/* 印出鏈結串列 */
void printLinkedList(ListNode *node) {
    if (node == NULL) {
        return;
    }
    while (node->next != NULL) {
        printf("%d -> ", node->val);
        node = node->next;
    }
    printf("%d\n", node->val);
}

typedef struct Trunk {
    struct Trunk *prev;
    char *str;
} Trunk;

Trunk *newTrunk(Trunk *prev, char *str) {
    Trunk *trunk = (Trunk *)malloc(sizeof(Trunk));
    trunk->prev = prev;
    trunk->str = (char *)malloc(strlen(str) + 1);
    snprintf(trunk->str, strlen(str) + 1, "%s", str);
    return trunk;
}

void showTrunks(Trunk *trunk) {
    if (trunk == NULL) {
        return;
    }
    showTrunks(trunk->prev);
    printf("%s", trunk->str);
}

/**
 * 印出二元樹
 * 這段印出樹狀結構的程式碼取自 TECHIE DELIGHT
 * https://www.techiedelight.com/c-program-print-binary-tree/
 */
void printTreeHelper(TreeNode *node, Trunk *prev, bool isRight) {
    if (node == NULL) {
        return;
    }
    char *prev_str = "    ";
    Trunk *trunk = newTrunk(prev, prev_str);
    printTreeHelper(node->right, trunk, true);
    if (prev == NULL) {
        trunk->str = "———";
    } else if (isRight) {
        trunk->str = "/———";
        prev_str = "   |";
    } else {
        trunk->str = "\\———";
        prev->str = prev_str;
    }
    showTrunks(trunk);
    printf("%d\n", node->val);

    if (prev != NULL) {
        prev->str = prev_str;
    }
    trunk->str = "   |";

    printTreeHelper(node->left, trunk, false);
}

/* 印出二元樹 */
void printTree(TreeNode *root) {
    printTreeHelper(root, NULL, false);
}

/* 印出堆積 */
void printHeap(int arr[], int size) {
    TreeNode *root;
    printf("堆積的陣列表示法：");
    printArray(arr, size);
    printf("堆積的樹狀表示法：\n");
    root = arrayToTree(arr, size);
    printTree(root);
}

#ifdef __cplusplus
}
#endif

#endif // PRINT_UTIL_H
