/**
 * File: avl_tree.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Структура AVL-дерева */
typedef struct {
    TreeNode *root;
} AVLTree;

/* Конструктор */
AVLTree *newAVLTree() {
    AVLTree *tree = (AVLTree *)malloc(sizeof(AVLTree));
    tree->root = NULL;
    return tree;
}

/* Деструктор */
void delAVLTree(AVLTree *tree) {
    freeMemoryTree(tree->root);
    free(tree);
}

/* Получить высоту узла */
int height(TreeNode *node) {
    // Высота пустого узла равна -1, а высота листа равна 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* Обновить высоту узла */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // Высота узла равна высоте более высокого поддерева + 1
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* Получить коэффициент баланса */
int balanceFactor(TreeNode *node) {
    // Баланс-фактор пустого узла равен 0
    if (node == NULL) {
        return 0;
    }
    // Баланс-фактор узла = высота левого поддерева - высота правого поддерева
    return height(node->left) - height(node->right);
}

/* Операция правого поворота */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
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
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
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
    int bf = balanceFactor(node);
    // Левосторонне перекошенное дерево
    if (bf > 1) {
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
    if (bf < -1) {
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

/* Рекурсивная вставка узла (вспомогательная функция) */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. Найти позицию вставки и вставить узел */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // Дублирующийся узел не вставлять, сразу вернуть результат
        return node;
    }
    // Обновить высоту узла
    updateHeight(node);
    /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
    node = rotate(node);
    // Вернуть корневой узел поддерева
    return node;
}

/* Вставить узел */
void insert(AVLTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
}

/* Рекурсивное удаление узла (вспомогательная функция) */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild;
    if (node == NULL) {
        return NULL;
    }
    /* 1. Найти узел и удалить его */
    if (val < node->val) {
        node->left = removeHelper(node->left, val);
    } else if (val > node->val) {
        node->right = removeHelper(node->right, val);
    } else {
        if (node->left == NULL || node->right == NULL) {
            child = node->left;
            if (node->right != NULL) {
                child = node->right;
            }
            // Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
            if (child == NULL) {
                return NULL;
            } else {
                // Если число дочерних узлов равно 1, сразу удалить node
                node = child;
            }
        } else {
            // Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
            TreeNode *temp = node->right;
            while (temp->left != NULL) {
                temp = temp->left;
            }
            int tempVal = temp->val;
            node->right = removeHelper(node->right, temp->val);
            node->val = tempVal;
        }
    }
    // Обновить высоту узла
    updateHeight(node);
    /* 2. Выполнить вращение, чтобы снова сбалансировать это поддерево */
    node = rotate(node);
    // Вернуть корневой узел поддерева
    return node;
}

/* Удалить узел */
// Поскольку подключен stdio.h, здесь нельзя использовать ключевое слово remove
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* Найти узел */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // Выполнять поиск в цикле и выйти после прохождения листового узла
    while (cur != NULL) {
        if (cur->val < val) {
            // Целевой узел находится в правом поддереве cur
            cur = cur->right;
        } else if (cur->val > val) {
            // Целевой узел находится в левом поддереве cur
            cur = cur->left;
        } else {
            // Найти целевой узел и выйти из цикла
            break;
        }
    }
    // Найти целевой узел и выйти из цикла
    return cur;
}

void testInsert(AVLTree *tree, int val) {
    insert(tree, val);
    printf("\nПосле вставки узла %d AVL-дерево имеет вид \n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\nПосле удаления узла %d AVL-дерево имеет вид \n", val);
    printTree(tree->root);
}

/* Driver Code */
int main() {
    /* Инициализировать пустое AVL-дерево */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* Вставить узел */
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
    testInsert(tree, 1);
    testInsert(tree, 2);
    testInsert(tree, 3);
    testInsert(tree, 4);
    testInsert(tree, 5);
    testInsert(tree, 8);
    testInsert(tree, 7);
    testInsert(tree, 9);
    testInsert(tree, 10);
    testInsert(tree, 6);

    /* Вставить повторяющийся узел */
    testInsert(tree, 7);

    /* Удалить узел */
    // Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
    testRemove(tree, 8); // Удалить узел степени 0
    testRemove(tree, 5); // Удалить узел степени 1
    testRemove(tree, 4); // Удалить узел степени 2

    /* Найти узел */
    TreeNode *node = search(tree, 7);
    printf("\nЗначение найденного объекта узла = %d \n", node->val);

    // Освободить память
    delAVLTree(tree);
    return 0;
}
