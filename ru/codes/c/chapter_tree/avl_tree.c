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
    // Высота пустого узла равна -1, высота листового узла равна 0
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
    // Коэффициент баланса пустого узла равен 0
    if (node == NULL) {
        return 0;
    }
    // Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
    return height(node->left) - height(node->right);
}

/* Операция правого вращения */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // Выполнить правое вращение узла node вокруг child
    child->right = node;
    node->left = grandChild;
    // Обновить высоту узла
    updateHeight(node);
    updateHeight(child);
    // Вернуть корневой узел поддерева после вращения
    return child;
}

/* Операция левого вращения */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // Выполнить левое вращение узла node вокруг child
    child->left = node;
    node->right = grandChild;
    // Обновить высоту узла
    updateHeight(node);
    updateHeight(child);
    // Вернуть корневой узел поддерева после вращения
    return child;
}

/* Выполнить вращение, чтобы снова сбалансировать поддерево */
TreeNode *rotate(TreeNode *node) {
    // Получить коэффициент баланса узла node
    int bf = balanceFactor(node);
    // Левосторонне перекошенное дерево
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // Правое вращение
            return rightRotate(node);
        } else {
            // Сначала левое вращение, затем правое
            node->left = leftRotate(node->left);
            return rightRotate(node);
        }
    }
    // Правосторонне перекошенное дерево
    if (bf < -1) {
        if (balanceFactor(node->right) <= 0) {
            // Левое вращение
            return leftRotate(node);
        } else {
            // Сначала правое вращение, затем левое
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // Дерево сбалансировано, вращение не требуется, вернуть сразу
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
        // Повторяющийся узел не вставлять, сразу вернуть
        return node;
    }
    // Обновить высоту узла
    updateHeight(node);
    /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
    node = rotate(node);
    // Вернуть корневой узел поддерева
    return node;
}

/* Вставка узла */
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
            // Число дочерних узлов = 0, удалить node и сразу вернуть
            if (child == NULL) {
                return NULL;
            } else {
                // Число дочерних узлов = 1, удалить node напрямую
                node = child;
            }
        } else {
            // Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
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
    /* 2. Выполнить вращение, чтобы снова сбалансировать поддерево */
    node = rotate(node);
    // Вернуть корневой узел поддерева
    return node;
}

/* Удаление узла */
// Из-за подключения stdio.h здесь нельзя использовать ключевое слово remove
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* Поиск узла */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // Искать в цикле и выйти после прохода за листовой узел
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
    /* Инициализация пустого AVL-дерева */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* Вставка узла */
    // Обратите внимание, как AVL-дерево сохраняет баланс после вставки узла
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

    /* Вставка повторяющегося узла */
    testInsert(tree, 7);

    /* Удаление узла */
    // Обратите внимание, как AVL-дерево сохраняет баланс после удаления узла
    testRemove(tree, 8); // Удаление узла степени 0
    testRemove(tree, 5); // Удаление узла степени 1
    testRemove(tree, 4); // Удаление узла степени 2

    /* Поиск узла */
    TreeNode *node = search(tree, 7);
    printf("\nНайденный объект узла, значение узла = %d \n", node->val);

    // Освободить память
    delAVLTree(tree);
    return 0;
}
