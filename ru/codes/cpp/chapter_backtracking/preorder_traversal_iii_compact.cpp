/**
 * File: preorder_traversal_iii_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> path;
vector<vector<TreeNode *>> res;

/* Предварительный обход: пример 3 */
void preOrder(TreeNode *root) {
    // Отсечение
    if (root == nullptr || root->val == 3) {
        return;
    }
    // Попытка
    path.push_back(root);
    if (root->val == 7) {
        // Записать решение
        res.push_back(path);
    }
    preOrder(root->left);
    preOrder(root->right);
    // Откат
    path.pop_back();
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\nИнициализация двоичного дерева" << endl;
    printTree(root);

    // Предварительный обход
    preOrder(root);

    cout << "\nВывести все пути от корня к узлу 7, не содержащие узлов со значением 3" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
