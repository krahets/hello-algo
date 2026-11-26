/**
 * File: preorder_traversal_iii_template.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Проверяем, является ли текущее состояние решением */
bool isSolution(vector<TreeNode *> &state) {
    return !state.empty() && state.back()->val == 7;
}

/* Сохраняем решение */
void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
    res.push_back(state);
}

/* Проверяем, допустим ли выбор в текущем состоянии */
bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
    return choice != nullptr && choice->val != 3;
}

/* Обновляем состояние */
void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.push_back(choice);
}

/* Восстанавливаем состояние */
void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.pop_back();
}

/* Поиск с возвратом: пример 3 */
void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
    // Проверяем, найдено ли решение
    if (isSolution(state)) {
        // Сохраняем решение
        recordSolution(state, res);
    }
    // Перебираем все варианты
    for (TreeNode *choice : choices) {
        // Отсечение: проверяем допустимость выбора
        if (isValid(state, choice)) {
            // Пробуем вариант и обновляем состояние
            makeChoice(state, choice);
            // Переходим к следующему выбору
            vector<TreeNode *> nextChoices{choice->left, choice->right};
            backtrack(state, nextChoices, res);
            // Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undoChoice(state, choice);
        }
    }
}

/* Основная программа */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\nСоздаём двоичное дерево" << endl;
    printTree(root);

    // Поиск с возвратом
    vector<TreeNode *> state;
    vector<TreeNode *> choices = {root};
    vector<vector<TreeNode *>> res;
    backtrack(state, choices, res);

    cout << "\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
