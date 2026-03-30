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

/* Поиск узла */
TreeNode *search(BinarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // Искать в цикле и выйти после прохода за листовой узел
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

/* Вставка узла */
void insert(BinarySearchTree *bst, int num) {
    // Если дерево пусто, инициализировать корневой узел
    if (bst->root == NULL) {
        bst->root = newTreeNode(num);
        return;
    }
    TreeNode *cur = bst->root, *pre = NULL;
    // Искать в цикле и выйти после прохода за листовой узел
    while (cur != NULL) {
        // Найти повторяющийся узел и сразу вернуть
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
    // Вставка узла
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* Удаление узла */
// Из-за подключения stdio.h здесь нельзя использовать ключевое слово remove
void removeItem(BinarySearchTree *bst, int num) {
    // Если дерево пусто, сразу вернуть
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // Искать в цикле и выйти после прохода за листовой узел
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
    // Если узел для удаления отсутствует, сразу вернуть
    if (cur == NULL)
        return;
    // Проверить, есть ли дочерние узлы у удаляемого узла
    if (cur->left == NULL || cur->right == NULL) {
        /* Число дочерних узлов = 0 или 1 */
        // Когда число дочерних узлов = 0 / 1, child = nullptr / этот дочерний узел
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
        // Перезаписать cur значением tmp
        cur->val = tmpVal;
    }
}

/* Driver Code */
int main() {
    /* Инициализация двоичного дерева поиска */
    int nums[] = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    BinarySearchTree *bst = newBinarySearchTree();
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        insert(bst, nums[i]);
    }
    printf("Инициализированное двоичное дерево\n");
    printTree(getRoot(bst));

    /* Поиск узла */
    TreeNode *node = search(bst, 7);
    printf("Значение найденного объекта узла = %d\n", node->val);

    /* Вставка узла */
    insert(bst, 16);
    printf("После вставки узла 16 двоичное дерево имеет вид\n");
    printTree(getRoot(bst));

    /* Удаление узла */
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
