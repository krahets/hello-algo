/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Класс двоичного дерева на основе массива */
class ArrayBinaryTree {
  public:
    /* Конструктор */
    ArrayBinaryTree(vector<int> arr) {
        tree = arr;
    }

    /* Ёмкость списка */
    int size() {
        return tree.size();
    }

    /* Получить значение узла с индексом i */
    int val(int i) {
        // Если индекс выходит за границы массива, вернуть INT_MAX — признак пустой позиции
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* Получить индекс левого потомка узла с индексом i */
    int left(int i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого потомка узла с индексом i */
    int right(int i) {
        return 2 * i + 2;
    }

    /* Получить индекс родителя узла с индексом i */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* Обход по уровням */
    vector<int> levelOrder() {
        vector<int> res;
        // Пройти непосредственно по массиву
        for (int i = 0; i < size(); i++) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    /* Прямой обход */
    vector<int> preOrder() {
        vector<int> res;
        dfs(0, "pre", res);
        return res;
    }

    /* Симметричный обход */
    vector<int> inOrder() {
        vector<int> res;
        dfs(0, "in", res);
        return res;
    }

    /* Обратный обход */
    vector<int> postOrder() {
        vector<int> res;
        dfs(0, "post", res);
        return res;
    }

  private:
    vector<int> tree;

    /* Обход в глубину */
    void dfs(int i, string order, vector<int> &res) {
        // Если позиция пуста, завершить вызов
        if (val(i) == INT_MAX)
            return;
        // Прямой обход
        if (order == "pre")
            res.push_back(val(i));
        dfs(left(i), order, res);
        // Симметричный обход
        if (order == "in")
            res.push_back(val(i));
        dfs(right(i), order, res);
        // Обратный обход
        if (order == "post")
            res.push_back(val(i));
    }
};

/* Основная программа */
int main() {
    // Инициализация двоичного дерева
    // INT_MAX обозначает пустую позицию nullptr
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\nИнициализация двоичного дерева\n";
    cout << "Представление двоичного дерева в виде массива:\n";
    printVector(arr);
    cout << "Связное представление двоичного дерева:\n";
    printTree(root);

    // Класс двоичного дерева на основе массива
    ArrayBinaryTree abt(arr);

    // Доступ к узлу
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\nИндекс текущего узла: " << i << ", значение: " << abt.val(i) << "\n";
    cout << "Индекс левого потомка: " << l << ", значение: " << (abt.val(l) != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "Индекс правого потомка: " << r << ", значение: " << (abt.val(r) != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "Индекс родителя: " << p << ", значение: " << (abt.val(p) != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // Обход дерева
    vector<int> res = abt.levelOrder();
    cout << "\nОбход по уровням: ";
    printVector(res);
    res = abt.preOrder();
    cout << "Прямой обход: ";
    printVector(res);
    res = abt.inOrder();
    cout << "Симметричный обход: ";
    printVector(res);
    res = abt.postOrder();
    cout << "Обратный обход: ";
    printVector(res);

    return 0;
}
