/**
 * File: binary_search_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* двоичное дерево поиска */
class BinarySearchTree {
  private:
    TreeNode *root;

  public:
    /* Конструктор */
    BinarySearchTree() {
        // Инициализировать пустое дерево
        root = nullptr;
    }

    /* Деструктор */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* Получить корневой узел двоичного дерева */
    TreeNode *getRoot() {
        return root;
    }

    /* Найти узел */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur != nullptr) {
            // Целевой узел находится в правом поддереве cur
            if (cur->val < num)
                cur = cur->right;
            // Целевой узел находится в левом поддереве cur
            else if (cur->val > num)
                cur = cur->left;
            // Найти целевой узел и выйти из цикла
            else
                break;
        }
        // Вернуть целевой узел
        return cur;
    }

    /* Вставить узел */
    void insert(int num) {
        // Если дерево пусто, инициализировать корневой узел
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur != nullptr) {
            // Найти дублирующийся узел и сразу вернуть результат
            if (cur->val == num)
                return;
            pre = cur;
            // Позиция вставки находится в правом поддереве cur
            if (cur->val < num)
                cur = cur->right;
            // Позиция вставки находится в левом поддереве cur
            else
                cur = cur->left;
        }
        // Вставить узел
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* Удалить узел */
    void remove(int num) {
        // Если дерево пусто, сразу вернуть результат
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur != nullptr) {
            // Найти узел для удаления и выйти из цикла
            if (cur->val == num)
                break;
            pre = cur;
            // Удаляемый узел находится в правом поддереве cur
            if (cur->val < num)
                cur = cur->right;
            // Удаляемый узел находится в левом поддереве cur
            else
                cur = cur->left;
        }
        // Если узла для удаления нет, сразу вернуть результат
        if (cur == nullptr)
            return;
        // Число дочерних узлов = 0 или 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // Когда число дочерних узлов равно 0 / 1, child = nullptr / этот дочерний узел
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // Удалить узел cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // Если удаляемый узел является корневым, заново назначить корневой узел
                root = child;
            }
            // Освободить память
            delete cur;
        }
        // Число дочерних узлов = 2
        else {
            // Получить следующий узел после cur в симметричном обходе
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // Рекурсивно удалить узел tmp
            remove(tmp->val);
            // Заменить cur значением tmp
            cur->val = tmpVal;
        }
    }
};

/* Driver Code */
int main() {
    /* Инициализировать двоичное дерево поиска */
    BinarySearchTree *bst = new BinarySearchTree();
    // Обратите внимание: разные порядки вставки порождают разные двоичные деревья, а данная последовательность может породить совершенное двоичное дерево
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "Инициализированное двоичное дерево:\n" << endl;
    printTree(bst->getRoot());

    /* Найти узел */
    TreeNode *node = bst->search(7);
    cout << endl << "Найденныйузелобъектравно" << node << ", значение узла =" << node->val << endl;

    /* Вставить узел */
    bst->insert(16);
    cout << endl << "После вставки узла 16 двоичное дерево имеет вид\n" << endl;
    printTree(bst->getRoot());

    /* Удалить узел */
    bst->remove(1);
    cout << endl << "После удаления узла 1 двоичное дерево имеет вид\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "После удаления узла 2 двоичное дерево имеет вид\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "После удаления узла 4 двоичное дерево имеет вид\n" << endl;
    printTree(bst->getRoot());

    // Освободить память
    delete bst;

    return 0;
}
