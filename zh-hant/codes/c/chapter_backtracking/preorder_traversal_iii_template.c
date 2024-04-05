/**
 * File: preorder_traversal_iii_template.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 假設路徑和結果長度不超過 100
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* 判斷當前狀態是否為解 */
bool isSolution(void) {
    return pathSize > 0 && path[pathSize - 1]->val == 7;
}

/* 記錄解 */
void recordSolution(void) {
    for (int i = 0; i < pathSize; i++) {
        res[resSize][i] = path[i];
    }
    resSize++;
}

/* 判斷在當前狀態下，該選擇是否合法 */
bool isValid(TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* 更新狀態 */
void makeChoice(TreeNode *choice) {
    path[pathSize++] = choice;
}

/* 恢復狀態 */
void undoChoice(void) {
    pathSize--;
}

/* 回溯演算法：例題三 */
void backtrack(TreeNode *choices[2]) {
    // 檢查是否為解
    if (isSolution()) {
        // 記錄解
        recordSolution();
    }
    // 走訪所有選擇
    for (int i = 0; i < 2; i++) {
        TreeNode *choice = choices[i];
        // 剪枝：檢查選擇是否合法
        if (isValid(choice)) {
            // 嘗試：做出選擇，更新狀態
            makeChoice(choice);
            // 進行下一輪選擇
            TreeNode *nextChoices[2] = {choice->left, choice->right};
            backtrack(nextChoices);
            // 回退：撤銷選擇，恢復到之前的狀態
            undoChoice();
        }
    }
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n初始化二元樹\n");
    printTree(root);

    // 回溯演算法
    TreeNode *choices[2] = {root, NULL};
    backtrack(choices);

    printf("\n輸出所有根節點到節點 7 的路徑，要求路徑中不包含值為 3 的節點\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // 釋放記憶體
    freeMemoryTree(root);
    return 0;
}
