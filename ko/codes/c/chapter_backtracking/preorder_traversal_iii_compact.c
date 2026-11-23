/**
 * File: preorder_traversal_iii_compact.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 경로와 결과의 길이가 100을 넘지 않는다고 가정
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* 전위 순회: 예제 3 */
void preOrder(TreeNode *root) {
    // 가지치기
    if (root == NULL || root->val == 3) {
        return;
    }
    // 시도
    path[pathSize++] = root;
    if (root->val == 7) {
        // 해를 기록한다
        for (int i = 0; i < pathSize; i++) {
            res[resSize][i] = path[i];
        }
        resSize++;
    }
    preOrder(root->left);
    preOrder(root->right);
    // 되돌리기
    pathSize--;
}

/* 실행 코드 */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n이진 트리 초기화\n");
    printTree(root);

    // 전위 순회
    preOrder(root);

    printf("\n값이 3인 노드를 포함하지 않는, 루트 노드에서 노드 7까지의 모든 경로 출력\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // 메모리 해제
    freeMemoryTree(root);
    return 0;
}
