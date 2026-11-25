/**
 * File: preorder_traversal_iii_template.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

// Assume the path and the result each have length at most 100
#define MAX_SIZE 100
#define MAX_RES_SIZE 100

TreeNode *path[MAX_SIZE];
TreeNode *res[MAX_RES_SIZE][MAX_SIZE];
int pathSize = 0, resSize = 0;

/* Check whether the current state is a solution */
bool isSolution(void) {
    return pathSize > 0 && path[pathSize - 1]->val == 7;
}

/* Record the solution */
void recordSolution(void) {
    for (int i = 0; i < pathSize; i++) {
        res[resSize][i] = path[i];
    }
    resSize++;
}

/* Check whether this choice is valid in the current state */
bool isValid(TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* Update the state */
void makeChoice(TreeNode *choice) {
    path[pathSize++] = choice;
}

/* Restore the state */
void undoChoice(void) {
    pathSize--;
}

/* Backtracking: example 3 */
void backtrack(TreeNode *choices[2]) {
    // Check for a solution
    if (isSolution()) {
        // Record the solution
        recordSolution();
    }
    // Try each choice
    for (int i = 0; i < 2; i++) {
        TreeNode *choice = choices[i];
        // Prune: check whether the choice is valid
        if (isValid(choice)) {
            // Make a choice and update the state
            makeChoice(choice);
            // Make the next choice
            TreeNode *nextChoices[2] = {choice->left, choice->right};
            backtrack(nextChoices);
            // Backtrack: undo the choice to restore the previous state
            undoChoice();
        }
    }
}

/* Driver code */
int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = arrayToTree(arr, sizeof(arr) / sizeof(arr[0]));
    printf("\nInitialize the binary tree\n");
    printTree(root);

    // Backtracking
    TreeNode *choices[2] = {root, NULL};
    backtrack(choices);

    printf("\nPrint all paths from the root to a node with value 7 that avoid nodes with value 3\n");
    for (int i = 0; i < resSize; ++i) {
        int *vals = malloc(MAX_SIZE * sizeof(int));
        int size = 0;
        for (int j = 0; res[i][j] != NULL; ++j) {
            vals[size++] = res[i][j]->val;
        }
        printArray(vals, size);
        free(vals);
    }

    // Free the memory
    freeMemoryTree(root);
    return 0;
}
