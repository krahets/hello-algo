/**
 * File: preorder_traversal_i_compact.c
 * Created Time: 2023-05-10
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 결과의 길이가 100을 넘지 않는다고 가정
#define MAX_SIZE 100

TreeNode *res[MAX_SIZE];
int resSize = 0;

/* 전위 순회: 예제 1 */
void preOrder(TreeNode *root) {
    if (root == NULL) {
        return;
    }
    if (root->val == 7) {
        // 해를 기록한다
        res[resSize++] = root;
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* 실행 코드 */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n이진 트리 초기화\n");
    printTree(root);

    // 전위 순회
    preOrder(root);

    printf("\n값이 7인 모든 노드 출력\n");
    int *vals = malloc(resSize * sizeof(int));
    for (int i = 0; i < resSize; i++) {
        vals[i] = res[i]->val;
    }
    printArray(vals, resSize);

    // 메모리 해제
    freeMemoryTree(root);
    free(vals);
    return 0;
}
