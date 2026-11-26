/**
 * File: preorder_traversal_iii_template.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 경로와 결과의 길이는 각각 100 이하라고 가정한다
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* 현재 상태가 해인지 확인한다 */
bool isSolution(void) {
    return pathSize > 0 && path[pathSize - 1]->val == 7;
}

/* 해를 기록한다 */
void recordSolution(void) {
    for (int i = 0; i < pathSize; i++) {
        res[resSize][i] = path[i];
    }
    resSize++;
}

/* 현재 상태에서 이 선택이 유효한지 확인한다 */
bool isValid(TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* 상태를 갱신한다 */
void makeChoice(TreeNode *choice) {
    path[pathSize++] = choice;
}

/* 상태를 복원한다 */
void undoChoice(void) {
    pathSize--;
}

/* 백트래킹: 예제 3 */
void backtrack(TreeNode *choices[2]) {
    // 해인지 확인한다
    if (isSolution()) {
        // 해를 기록한다
        recordSolution();
    }
    // 모든 선택지를 순회한다
    for (int i = 0; i < 2; i++) {
        TreeNode *choice = choices[i];
        // 가지치기: 선택이 유효한지 확인한다
        if (isValid(choice)) {
            // 시도: 하나를 선택하고 상태를 갱신한다
            makeChoice(choice);
            // 다음 선택을 진행한다
            TreeNode *nextChoices[2] = {choice->left, choice->right};
            backtrack(nextChoices);
            // 되돌리기: 선택을 취소하고 이전 상태를 복원한다
            undoChoice();
        }
    }
}

/* 실행 코드 */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n이진 트리 초기화\n");
    printTree(root);

    // 백트래킹 알고리즘
    TreeNode *choices[2] = {root, NULL};
    backtrack(choices);

    printf("\n루트에서 값이 7인 노드까지 값이 3인 노드를 거치지 않는 모든 경로 출력\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // 메모리를 해제한다
    freeMemoryTree(root);
    return 0;
}
