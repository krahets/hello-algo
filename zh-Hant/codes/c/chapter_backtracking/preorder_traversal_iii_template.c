/**
 * File: preorder_traversal_iii_template.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 假设路径和结果长度不超过 100
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* 判断当前状态是否为解 */
bool isSolution(void) {
    return pathSize > 0 && path[pathSize - 1]->val == 7;
}

/* 记录解 */
void recordSolution(void) {
    for (int i = 0; i < pathSize; i++) {
        res[resSize][i] = path[i];
    }
    resSize++;
}

/* 判断在当前状态下，该选择是否合法 */
bool isValid(TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* 更新状态 */
void makeChoice(TreeNode *choice) {
    path[pathSize++] = choice;
}

/* 恢复状态 */
void undoChoice(void) {
    pathSize--;
}

/* 回溯算法：例题三 */
void backtrack(TreeNode *choices[2]) {
    // 检查是否为解
    if (isSolution()) {
        // 记录解
        recordSolution();
    }
    // 遍历所有选择
    for (int i = 0; i < 2; i++) {
        TreeNode *choice = choices[i];
        // 剪枝：检查选择是否合法
        if (isValid(choice)) {
            // 尝试：做出选择，更新状态
            makeChoice(choice);
            // 进行下一轮选择
            TreeNode *nextChoices[2] = {choice->left, choice->right};
            backtrack(nextChoices);
            // 回退：撤销选择，恢复到之前的状态
            undoChoice();
        }
    }
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n初始化二叉树\n");
    printTree(root);

    // 回溯算法
    TreeNode *choices[2] = {root, NULL};
    backtrack(choices);

    printf("\n输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // 释放内存
    freeMemoryTree(root);
    return 0;
}
