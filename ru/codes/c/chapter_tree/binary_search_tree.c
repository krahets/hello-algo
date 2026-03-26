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
    // Инициализировать пустое дерево
    BinarySearchTree *bst = (BinarySearchTree *)malloc(sizeof(BinarySearchTree));
    bst->root = NULL;
    return bst;
}

/* Деструктор */
void delBinarySearchTree(BinarySearchTree *bst) {
    freeMemoryTree(bst->root);
    free(bst);
}

/* Получить корневой узел двоичного дерева */
TreeNode *getRoot(BinarySearchTree *bst) {
    return bst->root;
}

/* Найти узел */
TreeNode *search(BinarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // Выполнять поиск в цикле и выйти после прохождения листового узла
    while (cur != NULL) {
        if (cur->val < num) {
            // Целевой узел находится в правом поддереве cur
            cur = cur->right;
        } else if (cur->val > num) {
            // Целевой узел находится в левом поддереве cur
            cur = cur->left;
        } else {
            // Найти целевой узел и выйти из цикла
            break;
        }
    }
    // Вернуть целевой узел
    return cur;
}

/* Вставить узел */
void insert(BinarySearchTree *bst, int num) {
    // Если дерево пусто, инициализировать корневой узел
    if (bst->root == NULL) {
        bst->root = newTreeNode(num);
        return;
    }
    TreeNode *cur = bst->root, *pre = NULL;
    // Выполнять поиск в цикле и выйти после прохождения листового узла
    while (cur != NULL) {
        // Найти дублирующийся узел и сразу вернуть результат
        if (cur->val == num) {
            return;
        }
        pre = cur;
        if (cur->val < num) {
            // Позиция вставки находится в правом поддереве cur
            cur = cur->right;
        } else {
            // Позиция вставки находится в левом поддереве cur
            cur = cur->left;
        }
    }
    // Вставить узел
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* Удалить узел */
// Поскольку подключен stdio.h, здесь нельзя использовать ключевое слово remove
void removeItem(BinarySearchTree *bst, int num) {
    // Если дерево пусто, сразу вернуть результат
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // Выполнять поиск в цикле и выйти после прохождения листового узла
    while (cur != NULL) {
        // Найти узел для удаления и выйти из цикла
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // Удаляемый узел находится в правом поддереве root
            cur = cur->right;
        } else {
            // Удаляемый узел находится в левом поддереве root
            cur = cur->left;
        }
    }
    // Если узла для удаления нет, сразу вернуть результат
    if (cur == NULL)
        return;
    // Проверить, есть ли у удаляемого узла дочерние узлы
    if (cur->left == NULL || cur->right == NULL) {
        /* Число дочерних узлов = 0 или 1 */
        // Когда число дочерних узлов равно 0 / 1, child = nullptr / этот дочерний узел
        TreeNode *child = cur->left != NULL ? cur->left : cur->right;
        // Удалить узел cur
        if (pre->left == cur) {
            pre->left = child;
        } else {
            pre->right = child;
        }
        // Освободить память
        free(cur);
    } else {
        /* Число дочерних узлов = 2 */
        // Получить следующий узел после cur в симметричном обходе
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // Рекурсивно удалить узел tmp
        removeItem(bst, tmp->val);
        // Заменить cur значением tmp
        cur->val = tmpVal;
    }
}

/* Driver Code */
int main() {
    /* Инициализировать двоичное дерево поиска */
    int nums[] = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    BinarySearchTree *bst = newBinarySearchTree();
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        insert(bst, nums[i]);
    }
    printf("Инициализированное двоичное дерево:\n");
    printTree(getRoot(bst));

    /* Найти узел */
    TreeNode *node = search(bst, 7);
    printf("Значение найденного объекта узла = %d\n", node->val);

    /* Вставить узел */
    insert(bst, 16);
    printf("После вставки узла 16 двоичное дерево имеет вид\n");
    printTree(getRoot(bst));

    /* Удалить узел */
    removeItem(bst, 1);
    printf("После удаления узла 1 двоичное дерево имеет вид\n");
    printTree(getRoot(bst));
    removeItem(bst, 2);
    printf("После удаления узла 2 двоичное дерево имеет вид\n");
    printTree(getRoot(bst));
    removeItem(bst, 4);
    printf("После удаления узла 4 двоичное дерево имеет вид\n");
    printTree(getRoot(bst));

    // Освободить память
    delBinarySearchTree(bst);
    return 0;
}
