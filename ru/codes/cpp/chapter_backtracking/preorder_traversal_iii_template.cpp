/**
 * File: preorder_traversal_iii_template.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Проверить, является ли текущее состояние решением */
bool isSolution(vector<TreeNode *> &state) {
    return !state.empty() && state.back()->val == 7;
}

/* Записать решение */
void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
    res.push_back(state);
}

/* Проверить, допустим ли этот выбор в текущем состоянии */
bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
    return choice != nullptr && choice->val != 3;
}

/* Обновить состояние */
void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.push_back(choice);
}

/* Восстановить состояние */
void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.pop_back();
}

/* Алгоритм бэктрекинга: пример 3 */
void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
    // Проверить, является ли текущее состояние решением
    if (isSolution(state)) {
        // Записать решение
        recordSolution(state, res);
    }
    // Перебор всех вариантов выбора
    for (TreeNode *choice : choices) {
        // Отсечение: проверить допустимость выбора
        if (isValid(state, choice)) {
            // Попытка: сделать выбор и обновить состояние
            makeChoice(state, choice);
            // Перейти к следующему выбору
            vector<TreeNode *> nextChoices{choice->left, choice->right};
            backtrack(state, nextChoices, res);
            // Откат: отменить выбор и восстановить предыдущее состояние
            undoChoice(state, choice);
        }
    }
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\nИнициализация двоичного дерева" << endl;
    printTree(root);

    // Алгоритм бэктрекинга
    vector<TreeNode *> state;
    vector<TreeNode *> choices = {root};
    vector<vector<TreeNode *>> res;
    backtrack(state, choices, res);

    cout << "\nВывести все пути от корня к узлу 7, не содержащие узлов со значением 3" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
