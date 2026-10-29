/**
 * File: preorder_traversal_iii_template.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// 経路と結果の長さは 100 以下と仮定する
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* 現在の状態が解かを判定 */
bool isSolution(void) {
    return pathSize > 0 && path[pathSize - 1]->val == 7;
}

/* 解を記録する */
void recordSolution(void) {
    for (int i = 0; i < pathSize; i++) {
        res[resSize][i] = path[i];
    }
    resSize++;
}

/* 現在の状態でこの選択が有効か判定 */
bool isValid(TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* 状態を更新する */
void makeChoice(TreeNode *choice) {
    path[pathSize++] = choice;
}

/* 状態を復元する */
void undoChoice(void) {
    pathSize--;
}

/* バックトラッキング：例題 3 */
void backtrack(TreeNode *choices[2]) {
    // 解かを確認
    if (isSolution()) {
        // 解を記録する
        recordSolution();
    }
    // すべての選択肢を走査する
    for (int i = 0; i < 2; i++) {
        TreeNode *choice = choices[i];
        // 枝刈り：選択が有効か確認
        if (isValid(choice)) {
            // 試行：選択を行い、状態を更新する
            makeChoice(choice);
            // 次の選択に進む
            TreeNode *nextChoices[2] = {choice->left, choice->right};
            backtrack(nextChoices);
            // 復元：選択を取り消し、以前の状態に戻す
            undoChoice();
        }
    }
}

/* 実行用コード */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\n二分木を初期化する\n");
    printTree(root);

    // バックトラッキング
    TreeNode *choices[2] = {root, NULL};
    backtrack(choices);

    printf("\n値が 3 のノードを含まない、根ノードからノード 7 までのすべての経路を出力する\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // メモリを解放する
    freeMemoryTree(root);
    return 0;
}
