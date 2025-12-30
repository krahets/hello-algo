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

/* Print array */
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

/* Print array */
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

/* Print linked list */
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
    trunk->str = (char *)malloc(sizeof(char) * 10);
    strcpy(trunk->str, str);
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
 * Print binary tree
 * This tree printer is borrowed from TECHIE DELIGHT
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

/* Print binary tree */
void printTree(TreeNode *root) {
    printTreeHelper(root, NULL, false);
}

/* Print heap */
void printHeap(int arr[], int size) {
    TreeNode *root;
    printf("Heap array representation:");
    printArray(arr, size);
    printf("Heap tree representation:\n");
    root = arrayToTree(arr, size);
    printTree(root);
}

#ifdef __cplusplus
}
#endif

#endif // PRINT_UTIL_H
