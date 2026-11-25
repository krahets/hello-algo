/**
 * File: binary_search_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Двоичное дерево поиска */
class BinarySearchTree {
  private:
    TreeNode *root;

  public:
    /* Конструктор */
    BinarySearchTree() {
        // Инициализация пустого дерева
        root = nullptr;
    }

    /* Деструктор */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* Получить корень двоичного дерева */
    TreeNode *getRoot() {
        return root;
    }

    /* Поиск узла */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // Искать в цикле до выхода за пределы листа
        while (cur != nullptr) {
            // Искомый узел в правом поддереве cur
            if (cur->val < num)
                cur = cur->right;
            // Искомый узел в левом поддереве cur
            else if (cur->val > num)
                cur = cur->left;
            // Узел найден: выйти из цикла
            else
                break;
        }
        // Вернуть искомый узел
        return cur;
    }

    /* Вставка узла */
    void insert(int num) {
        // Если дерево пусто, создать корень
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // Искать в цикле до выхода за пределы листа
        while (cur != nullptr) {
            // Такой узел уже есть: завершить вызов
            if (cur->val == num)
                return;
            pre = cur;
            // Место вставки в правом поддереве cur
            if (cur->val < num)
                cur = cur->right;
            // Место вставки в левом поддереве cur
            else
                cur = cur->left;
        }
        // Вставка узла
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* Удаление узла */
    void remove(int num) {
        // Если дерево пусто, сразу завершить вызов
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // Искать в цикле до выхода за пределы листа
        while (cur != nullptr) {
            // Узел для удаления найден: выйти из цикла
            if (cur->val == num)
                break;
            pre = cur;
            // Узел для удаления в правом поддереве cur
            if (cur->val < num)
                cur = cur->right;
            // Узел для удаления в левом поддереве cur
            else
                cur = cur->left;
        }
        // Если узел для удаления не найден, завершить вызов
        if (cur == nullptr)
            return;
        // Число потомков равно 0 или 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // Если потомков нет, child = nullptr, если потомок один, child указывает на него
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // Удалить узел cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // Если удаляется корень, назначить новый корень
                root = child;
            }
            // Освободить память
            delete cur;
        }
        // Число потомков равно 2
        else {
            // Найти следующий за cur узел в порядке симметричного обхода
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Рекурсивно удалить узел tmp
            remove(tmp->val);
            // Заменить значение cur значением tmp
            cur->val = tmpVal;
        }
    }
};

/* Основная программа */
int main() {
    /* Инициализация двоичного дерева поиска */
    BinarySearchTree *bst = new BinarySearchTree();
    // От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "Исходное двоичное дерево:\n" << endl;
    printTree(bst->getRoot());

    /* Поиск узла */
    TreeNode *node = bst->search(7);
    cout << endl << "Найденный узел: " << node << ", значение узла = " << node->val << endl;

    /* Вставка узла */
    bst->insert(16);
    cout << endl << "Двоичное дерево после вставки узла 16:\n" << endl;
    printTree(bst->getRoot());

    /* Удаление узла */
    bst->remove(1);
    cout << endl << "Двоичное дерево после удаления узла 1:\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "Двоичное дерево после удаления узла 2:\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "Двоичное дерево после удаления узла 4:\n" << endl;
    printTree(bst->getRoot());

    // Освободить память
    delete bst;

    return 0;
}
