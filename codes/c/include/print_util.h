/**
 * File: print_util.h
 * Created Time: 2022-12-21
 * Author: MolDum (moldum@163.com)、Reanon (793584285@qq.com)
 */

#ifndef PRINT_UTIL_H
#define PRINT_UTIL_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "list_node.h"
#include "tree_node.h"

#ifdef __cplusplus
extern "C" {
#endif


/**
 * @brief Print an Array
 *
 * @param arr
 * @param size
 */
static void printArray(int *arr, int size) {
    printf("[");
    for (int i = 0; i < size - 1; i++) {
        if (arr[i] != NIL) {
            printf("%d, ", arr[i]);
        } else {
            printf("NULL, ");
        }
    }
    if (arr[size - 1] != NIL) {
        printf("%d]\n", arr[size - 1]);
    }else{
        printf("NULL]\n");
    }
}

/**
 * @brief Print a linked list
 *
 * @param head
 */
static void printLinkedList(ListNode *node) {
    if (node == NULL) {
        return;
    }
    while (node->next != NULL) {
        printf("%d -> ", node->val);
        node = node->next;
    }
    printf("%d\n", node->val);
}

struct Trunk {
    struct Trunk *prev;
    char *str;
};

typedef struct Trunk Trunk;

Trunk *newTrunk(Trunk *prev, char *str) {
    Trunk *trunk = (Trunk *) malloc(sizeof(Trunk));
    trunk->prev = prev;
    trunk->str = (char *) malloc(sizeof(char) * 10);
    strcpy(trunk->str, str);
    return trunk;
}

/**
 * @brief Helper function to print branches of the binary tree
 *
 * @param trunk
 */
void showTrunks(Trunk *trunk) {
    if (trunk == NULL) {
        return;
    }
    showTrunks(trunk->prev);
    printf("%s", trunk->str);
}

/**
 * Help to print a binary tree, hide more details
 * @param node
 * @param prev
 * @param isLeft
 */
static void printTreeHelper(TreeNode *node, Trunk *prev, bool isLeft) {
    if (node == NULL) {
        return;
    }
    char *prev_str = "    ";
    Trunk *trunk = newTrunk(prev, prev_str);
    printTreeHelper(node->right, trunk, true);
    if (prev == NULL) {
        trunk->str = "———";
    } else if (isLeft) {
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

/**
 * @brief Print a binary tree
 *
 * @param head
 */
static void printTree(TreeNode *root) {
    printTreeHelper(root, NULL, false);
}


#ifdef __cplusplus
}
#endif

#endif // PRINT_UTIL_H
