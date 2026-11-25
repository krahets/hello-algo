/**
 * File: binary_search_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* Структура двоичного дерева поиска */
typedef struct {
    TreeNode *root;
} BinarySearchTree;

/* Конструктор */
BinarySearchTree *newBinarySearchTree() {
    // Инициализация пустого дерева
    BinarySearchTree *bst = (BinarySearchTree *)malloc(sizeof(BinarySearchTree));
    bst->root = NULL;
    return bst;
}

/* Деструктор */
void delBinarySearchTree(BinarySearchTree *bst) {
    freeMemoryTree(bst->root);
    free(bst);
}

/* Получить корень двоичного дерева */
TreeNode *getRoot(BinarySearchTree *bst) {
    return bst->root;
}

/* Поиск узла */
TreeNode *search(BinarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // Искать в цикле до выхода за пределы листа
    while (cur != NULL) {
        if (cur->val < num) {
            // Искомый узел в правом поддереве cur
            cur = cur->right;
        } else if (cur->val > num) {
            // Искомый узел в левом поддереве cur
            cur = cur->left;
        } else {
            // Узел найден: выйти из цикла
            break;
        }
    }
    // Вернуть искомый узел
    return cur;
}

/* Вставка узла */
void insert(BinarySearchTree *bst, int num) {
    // Если дерево пусто, создать корень
    if (bst->root == NULL) {
        bst->root = newTreeNode(num);
        return;
    }
    TreeNode *cur = bst->root, *pre = NULL;
    // Искать в цикле до выхода за пределы листа
    while (cur != NULL) {
        // Такой узел уже есть: завершить вызов
        if (cur->val == num) {
            return;
        }
        pre = cur;
        if (cur->val < num) {
            // Место вставки в правом поддереве cur
            cur = cur->right;
        } else {
            // Место вставки в левом поддереве cur
            cur = cur->left;
        }
    }
    // Вставка узла
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* Удаление узла */
// Заголовок stdio.h уже объявляет remove, поэтому здесь это имя использовать нельзя
void removeItem(BinarySearchTree *bst, int num) {
    // Если дерево пусто, сразу завершить вызов
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // Искать в цикле до выхода за пределы листа
    while (cur != NULL) {
        // Узел для удаления найден: выйти из цикла
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // Узел для удаления в правом поддереве root
            cur = cur->right;
        } else {
            // Узел для удаления в левом поддереве root
            cur = cur->left;
        }
    }
    // Если узел для удаления не найден, завершить вызов
    if (cur == NULL)
        return;
    // Проверить, есть ли у удаляемого узла потомки
    if (cur->left == NULL || cur->right == NULL) {
        /* Число потомков равно 0 или 1 */
        // Если потомков нет, child = nullptr, если потомок один, child указывает на него
        TreeNode *child = cur->left != NULL ? cur->left : cur->right;
        // Удалить узел cur
        if (pre == NULL) {
            bst->root = child;
        } else if (pre->left == cur) {
            pre->left = child;
        } else {
            pre->right = child;
        }
        // Освободить память
        free(cur);
    } else {
        /* Число потомков равно 2 */
        // Найти следующий за cur узел в порядке симметричного обхода
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // Рекурсивно удалить узел tmp
        removeItem(bst, tmp->val);
        // Заменить значение cur значением tmp
        cur->val = tmpVal;
    }
}

/* Основная программа */
int main() {
    /* Инициализация двоичного дерева поиска */
    int nums[] = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    BinarySearchTree *bst = newBinarySearchTree();
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        insert(bst, nums[i]);
    }
    printf("Исходное двоичное дерево:\n");
    printTree(getRoot(bst));

    /* Поиск узла */
    TreeNode *node = search(bst, 7);
    printf("Значение найденного узла = %d\n", node->val);

    /* Вставка узла */
    insert(bst, 16);
    printf("Двоичное дерево после вставки узла 16:\n");
    printTree(getRoot(bst));

    /* Удаление узла */
    removeItem(bst, 1);
    printf("Двоичное дерево после удаления узла 1:\n");
    printTree(getRoot(bst));
    removeItem(bst, 2);
    printf("Двоичное дерево после удаления узла 2:\n");
    printTree(getRoot(bst));
    removeItem(bst, 4);
    printf("Двоичное дерево после удаления узла 4:\n");
    printTree(getRoot(bst));

    // Освободить память
    delBinarySearchTree(bst);
    return 0;
}
