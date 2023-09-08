/**
 * File: preorder_traversal_iii_template.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 判断当前状态是否为解 */
bool isSolution(vector *state) {
    return state->size != 0 && ((TreeNode *)(state->data[state->size - 1]))->val == 7;
}

/* 记录解 */
void recordSolution(vector *state, vector *res) {
    vector *newPath = newVector();
    for (int i = 0; i < state->size; i++) {
        vectorPushback(newPath, state->data[i], sizeof(int));
    }
    vectorPushback(res, newPath, sizeof(vector));
}

/* 判断在当前状态下，该选择是否合法 */
bool isValid(vector *state, TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* 更新状态 */
void makeChoice(vector *state, TreeNode *choice) {
    vectorPushback(state, choice, sizeof(TreeNode));
}

/* 恢复状态 */
void undoChoice(vector *state, TreeNode *choice) {
    vectorPopback(state);
}

/* 回溯算法：例题三 */
void backtrack(vector *state, vector *choices, vector *res) {
    // 检查是否为解
    if (isSolution(state)) {
        // 记录解
        recordSolution(state, res);
        return;
    }
    // 遍历所有选择
    for (int i = 0; i < choices->size; i++) {
        TreeNode *choice = choices->data[i];
        // 剪枝：检查选择是否合法
        if (isValid(state, choice)) {
            // 尝试：做出选择，更新状态
            makeChoice(state, choice);
            // 进行下一轮选择
            vector *nextChoices = newVector();
            vectorPushback(nextChoices, choice->left, sizeof(TreeNode));
            vectorPushback(nextChoices, choice->right, sizeof(TreeNode));
            backtrack(state, nextChoices, res);
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state, choice);
        }
    }
}

// 打印向量中的元素
void printFunc(vector *v, void *p) {
    TreeNode *node = p;
    printf("%d ", node->val);
}

/* Driver Code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    int n = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrToTree(arr, n);
    printf("\r\n初始化二叉树\r\n");
    printTree(root);

    // 回溯算法
    vector *state = newVector();
    vector *choices = newVector();
    vector *res = newVector();
    vectorPushback(choices, root, sizeof(TreeNode));
    backtrack(state, choices, res);

    printf("输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点:\n");
    for (int i = 0; i < res->size; i++) {
        vector *path = res->data[i];
        vector *vals = newVector();
        for (int j = 0; j < path->size; j++) {
            TreeNode *node = path->data[j];
            vectorPushback(vals, &node->val, sizeof(int));
        }
        printVector(vals, printFunc);
    }

    // 释放内存
    delVector(state);
    delVector(choices);
    delVector(res);
    return 0;
}
