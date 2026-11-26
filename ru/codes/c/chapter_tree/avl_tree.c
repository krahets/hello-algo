/**
 * File: avl_tree.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Структура АВЛ-дерева */
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
    // Высота пустого узла равна -1, высота листа равна 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* Обновить высоту узла */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // Высота узла на 1 больше высоты самого высокого поддерева
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
    // Коэффициент баланса узла равен высоте левого поддерева минус высота правого
    return height(node->left) - height(node->right);
}

/* Правый поворот */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // Повернуть node вправо вокруг child
    child->right = node;
    node->left = grandChild;
    // Обновить высоту узла
    updateHeight(node);
    updateHeight(child);
    // Вернуть корень поддерева после поворота
    return child;
}

/* Левый поворот */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // Повернуть node влево вокруг child
    child->left = node;
    node->right = grandChild;
    // Обновить высоту узла
    updateHeight(node);
    updateHeight(child);
    // Вернуть корень поддерева после поворота
    return child;
}

/* Выполнить поворот, чтобы восстановить баланс поддерева */
TreeNode *rotate(TreeNode *node) {
    // Получить коэффициент баланса узла node
    int bf = balanceFactor(node);
    // Перевес влево
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // Поворот вправо
            return rightRotate(node);
        } else {
            // Сначала поворот влево, затем вправо
            node->left = leftRotate(node->left);
            return rightRotate(node);
        }
    }
    // Перевес вправо
    if (bf < -1) {
        if (balanceFactor(node->right) <= 0) {
            // Поворот влево
            return leftRotate(node);
        } else {
            // Сначала поворот вправо, затем влево
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // Дерево сбалансировано: завершить вызов без поворота
    return node;
}

/* Рекурсивная вставка узла (вспомогательная функция) */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. Найти место вставки и вставить узел */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // Такой узел уже есть: завершить вызов без вставки
        return node;
    }
    // Обновить высоту узла
    updateHeight(node);
    /* 2. Восстановить баланс поддерева с помощью поворота */
    node = rotate(node);
    // Вернуть корень поддерева
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
    /* 1. Найти и удалить узел */
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
            // Нет потомков: удалить node и завершить вызов
            if (child == NULL) {
                return NULL;
            } else {
                // Один потомок: удалить node
                node = child;
            }
        } else {
            // Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
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
    /* 2. Восстановить баланс поддерева с помощью поворота */
    node = rotate(node);
    // Вернуть корень поддерева
    return node;
}

/* Удаление узла */
// Заголовок stdio.h уже объявляет remove, поэтому здесь это имя использовать нельзя
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* Поиск узла */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // Искать в цикле до выхода за пределы листа
    while (cur != NULL) {
        if (cur->val < val) {
            // Искомый узел в правом поддереве cur
            cur = cur->right;
        } else if (cur->val > val) {
            // Искомый узел в левом поддереве cur
            cur = cur->left;
        } else {
            // Узел найден: выйти из цикла
            break;
        }
    }
    // Узел найден: выйти из цикла
    return cur;
}

void testInsert(AVLTree *tree, int val) {
    insert(tree, val);
    printf("\nАВЛ-дерево после вставки узла %d:\n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\nАВЛ-дерево после удаления узла %d:\n", val);
    printTree(tree->root);
}

/* Основная программа */
int main() {
    /* Инициализация пустого АВЛ-дерева */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* Вставка узла */
    // Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
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
    // Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
    testRemove(tree, 8); // Удаление узла без потомков
    testRemove(tree, 5); // Удаление узла с одним потомком
    testRemove(tree, 4); // Удаление узла с двумя потомками

    /* Поиск узла */
    TreeNode *node = search(tree, 7);
    printf("\nЗначение найденного узла = %d \n", node->val);

    // Освободить память
    delAVLTree(tree);
    return 0;
}
