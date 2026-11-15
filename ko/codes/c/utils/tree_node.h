/**
 * File: tree_node.h
 * Created Time: 2023-01-09
 * Author: Reanon (793584285@qq.com)
 */

#ifndef TREE_NODE_H
#define TREE_NODE_H

#ifdef __cplusplus
extern "C" {
#endif

#include <limits.h>

#define MAX_NODE_SIZE 5000

/* 이진 트리 노드 구조체 */
typedef struct TreeNode {
    int val;                // 노드 값
    int height;             // 노드 높이
    struct TreeNode *left;  // 왼쪽 자식 노드 포인터
    struct TreeNode *right; // 오른쪽 자식 노드 포인터
} TreeNode;

/* 생성자 */
TreeNode *newTreeNode(int val) {
    TreeNode *node;

    node = (TreeNode *)malloc(sizeof(TreeNode));
    node->val = val;
    node->height = 0;
    node->left = NULL;
    node->right = NULL;
    return node;
}

// 직렬화 인코딩 규칙은 다음을 참고한다:
// https://www.hello-algo.com/ko/chapter_tree/array_representation_of_tree/
// 이진 트리의 배열 표현:
// [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
// 이진 트리의 연결 리스트 표현:
//             /——— 15
//         /——— 7
//     /——— 3
//    |    \——— 6
//    |        \——— 12
// ——— 1
//     \——— 2
//        |    /——— 9
//         \——— 4
//             \——— 8

/* 리스트를 이진 트리로 역직렬화: 재귀 */
TreeNode *arrayToTreeDFS(int *arr, int size, int i) {
    if (i < 0 || i >= size || arr[i] == INT_MAX) {
        return NULL;
    }
    TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
    root->val = arr[i];
    root->left = arrayToTreeDFS(arr, size, 2 * i + 1);
    root->right = arrayToTreeDFS(arr, size, 2 * i + 2);
    return root;
}

/* 리스트를 이진 트리로 역직렬화 */
TreeNode *arrayToTree(int *arr, int size) {
    return arrayToTreeDFS(arr, size, 0);
}

/* 이진 트리를 리스트로 직렬화: 재귀 */
void treeToArrayDFS(TreeNode *root, int i, int *res, int *size) {
    if (root == NULL) {
        return;
    }
    while (i >= *size) {
        res = realloc(res, (*size + 1) * sizeof(int));
        res[*size] = INT_MAX;
        (*size)++;
    }
    res[i] = root->val;
    treeToArrayDFS(root->left, 2 * i + 1, res, size);
    treeToArrayDFS(root->right, 2 * i + 2, res, size);
}

/* 이진 트리를 리스트로 직렬화 */
int *treeToArray(TreeNode *root, int *size) {
    *size = 0;
    int *res = NULL;
    treeToArrayDFS(root, 0, res, size);
    return res;
}

/* 이진 트리의 메모리를 해제한다 */
void freeMemoryTree(TreeNode *root) {
    if (root == NULL)
        return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    free(root);
}

#ifdef __cplusplus
}
#endif

#endif // TREE_NODE_H
