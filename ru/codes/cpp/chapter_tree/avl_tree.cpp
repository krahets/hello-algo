/**
 * File: avl_tree.cpp
 * Created Time: 2023-02-03
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* AVL-дерево */
class AVLTree {
  private:
    /* Обновить высоту узла */
    void updateHeight(TreeNode *node) {
        // Высота узла равна высоте более высокого поддерева + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }

    /* Операция правого поворота */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
        // Используя child как опорную точку, выполнить правый поворот node
        child->right = node;
        node->left = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Операция левого поворота */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
        // Используя child как опорную точку, выполнить левый поворот node
        child->left = node;
        node->right = grandChild;
        // Обновить высоту узла
        updateHeight(node);
        updateHeight(child);
        // Вернуть корневой узел поддерева после вращения
        return child;
    }

    /* Выполнить поворот, чтобы восстановить баланс этого поддерева */
    TreeNode *rotate(TreeNode *node) {
        // Получить коэффициент баланса узла node
        int _balanceFactor = balanceFactor(node);
        // Левосторонне перекошенное дерево
        if (_balanceFactor > 1) {
            if (balanceFactor(node->left) >= 0) {
                // Правый поворот
                return rightRotate(node);
            } else {
                // Сначала выполнить левый поворот, затем правый
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // Правосторонне перекошенное дерево
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // Левый поворот
                return leftRotate(node);
            } else {
                // Сначала выполнить правый поворот, затем левый
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // Дерево сбалансировано, вращение не требуется, можно сразу вернуть результат
        return node;
    }

    /* рекурсиявставить узел(вспомогательный метод) */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. Найти позицию вставки и вставить узел */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // Дублирующийся узел не вставлять, сразу вернуть результат
        updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

    /* рекурсияУдалить узел(вспомогательный метод) */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. Найти узел и удалить его */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // Если число дочерних узлов равно 1, сразу удалить node
                else {
                    delete node;
                    node = child;
                }
            } else {
                // Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // Обновить высоту узла
        /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
        node = rotate(node);
        // Вернуть корневой узел поддерева
        return node;
    }

  public:
    TreeNode *root; // корневой узел

    /* Получить высоту узла */
    int height(TreeNode *node) {
        // Высота пустого узла равна -1, а высота листа равна 0
        return node == nullptr ? -1 : node->height;
    }

    /* Получить коэффициент баланса */
    int balanceFactor(TreeNode *node) {
        // Баланс-фактор пустого узла равен 0
        if (node == nullptr)
            return 0;
        // Баланс-фактор узла = высота левого поддерева - высота правого поддерева
        return height(node->left) - height(node->right);
    }

    /* Вставить узел */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* Удалить узел */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* Найти узел */
    TreeNode *search(int val) {
        TreeNode *cur = root;
        // Выполнять поиск в цикле и выйти после прохождения листового узла
        while (cur != nullptr) {
            // Целевой узел находится в правом поддереве cur
            if (cur->val < val)
                cur = cur->right;
            // Целевой узел находится в левом поддереве cur
            else if (cur->val > val)
                cur = cur->left;
            // Найти целевой узел и выйти из цикла
            else
                break;
        }
        // Вернуть целевой узел
        return cur;
    }

    /* Конструктор */
    AVLTree() : root(nullptr) {
    }

    /* Деструктор */
    ~AVLTree() {
        freeMemoryTree(root);
    }
};

void testInsert(AVLTree &tree, int val) {
    tree.insert(val);
    cout << "\nПосле вставки узла " << val << " AVL-дерево имеет вид" << endl;
    printTree(tree.root);
}

void testRemove(AVLTree &tree, int val) {
    tree.remove(val);
    cout << "\nПосле удаления узла " << val << " AVL-дерево имеет вид" << endl;
    printTree(tree.root);
}

/* Driver Code */
int main() {
    /* Инициализировать пустое AVL-дерево */
    AVLTree avlTree;

    /* Вставить узел */
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
    testInsert(avlTree, 1);
    testInsert(avlTree, 2);
    testInsert(avlTree, 3);
    testInsert(avlTree, 4);
    testInsert(avlTree, 5);
    testInsert(avlTree, 8);
    testInsert(avlTree, 7);
    testInsert(avlTree, 9);
    testInsert(avlTree, 10);
    testInsert(avlTree, 6);

    /* Вставить повторяющийся узел */
    testInsert(avlTree, 7);

    /* Удалить узел */
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
    testRemove(avlTree, 8); // Удалить узел степени 0
    testRemove(avlTree, 5); // Удалить узел степени 1
    testRemove(avlTree, 4); // Удалить узел степени 2

    /* Найти узел */
    TreeNode *node = avlTree.search(7);
    cout << "\nНайденныйузелобъектравно" << node << ", значение узла =" << node->val << endl;
}
