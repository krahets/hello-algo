/**
 * File: binary_tree_dfs.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

#define MAX_SIZE 100

// 순회 결과를 저장할 보조 배열
int arr[MAX_SIZE];

/* 전위 순회 */
void preOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 방문 순서: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
    arr[(*size)++] = root->val;
    preOrder(root->left, size);
    preOrder(root->right, size);
}

/* 중위 순회 */
void inOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 방문 순서: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
    inOrder(root->left, size);
    arr[(*size)++] = root->val;
    inOrder(root->right, size);
}

/* 후위 순회 */
void postOrder(TreeNode *root, int *size) {
    if (root == NULL)
        return;
    // 방문 순서: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
    postOrder(root->left, size);
    postOrder(root->right, size);
    arr[(*size)++] = root->val;
}

/* 실행 코드 */
int main() {
    /* 이진 트리 초기화 */
    // 배열에서 바로 이진 트리를 만드는 함수를 사용한다
    int nums[] = {1, 2, 3, 4, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);
    printf("이진 트리 초기화\n");
    printTree(root);

    /* 전위 순회 */
    // 보조 배열 초기화
    size = 0;
    preOrder(root, &size);
    printf("전위 순회로 출력한 노드 순서 = ");
    printArray(arr, size);

    /* 중위 순회 */
    size = 0;
    inOrder(root, &size);
    printf("중위 순회로 출력한 노드 순서 = ");
    printArray(arr, size);

    /* 후위 순회 */
    size = 0;
    postOrder(root, &size);
    printf("후위 순회로 출력한 노드 순서 = ");
    printArray(arr, size);

    freeMemoryTree(root);
    return 0;
}
