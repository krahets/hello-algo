/**
 * File: binary_search_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 二元搜尋樹結構體 */
typedef struct {
    TreeNode *root;
} BinarySearchTree;

/* 建構函式 */
BinarySearchTree *newBinarySearchTree() {
    // 初始化空樹
    BinarySearchTree *bst = (BinarySearchTree *)malloc(sizeof(BinarySearchTree));
    bst->root = NULL;
    return bst;
}

/* 解構函式 */
void delBinarySearchTree(BinarySearchTree *bst) {
    freeMemoryTree(bst->root);
    free(bst);
}

/* 取得二元樹的根節點 */
TreeNode *getRoot(BinarySearchTree *bst) {
    return bst->root;
}

/* 搜尋節點 */
TreeNode *search(BinarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // 用迴圈搜尋，越過葉節點後跳出迴圈
    while (cur != NULL) {
        if (cur->val < num) {
            // 目標節點在 cur 的右子樹中
            cur = cur->right;
        } else if (cur->val > num) {
            // 目標節點在 cur 的左子樹中
            cur = cur->left;
        } else {
            // 找到目標節點，跳出迴圈
            break;
        }
    }
    // 回傳目標節點
    return cur;
}

/* 插入節點 */
void insert(BinarySearchTree *bst, int num) {
    // 若樹為空，則初始化根節點
    if (bst->root == NULL) {
        bst->root = newTreeNode(num);
        return;
    }
    TreeNode *cur = bst->root, *pre = NULL;
    // 用迴圈搜尋，越過葉節點後跳出迴圈
    while (cur != NULL) {
        // 找到重複節點，直接返回
        if (cur->val == num) {
            return;
        }
        pre = cur;
        if (cur->val < num) {
            // 插入位置在 cur 的右子樹中
            cur = cur->right;
        } else {
            // 插入位置在 cur 的左子樹中
            cur = cur->left;
        }
    }
    // 插入節點
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* 刪除節點 */
// 由於已引入 stdio.h，這裡無法使用 remove 這個名稱
void removeItem(BinarySearchTree *bst, int num) {
    // 若樹為空，直接返回
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // 用迴圈搜尋，越過葉節點後跳出迴圈
    while (cur != NULL) {
        // 找到要刪除的節點，跳出迴圈
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // 要刪除的節點在 root 的右子樹中
            cur = cur->right;
        } else {
            // 要刪除的節點在 root 的左子樹中
            cur = cur->left;
        }
    }
    // 若找不到要刪除的節點，直接返回
    if (cur == NULL)
        return;
    // 判斷要刪除的節點是否有子節點
    if (cur->left == NULL || cur->right == NULL) {
        /* 子節點數為 0 或 1 */
        // 有 0 個子節點時，child = nullptr；只有 1 個時，child 指向該子節點
        TreeNode *child = cur->left != NULL ? cur->left : cur->right;
        // 刪除節點 cur
        if (pre == NULL) {
            bst->root = child;
        } else if (pre->left == cur) {
            pre->left = child;
        } else {
            pre->right = child;
        }
        // 釋放記憶體
        free(cur);
    } else {
        /* 子節點數為 2 */
        // 取得中序走訪中 cur 的下一個節點
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // 以遞迴刪除節點 tmp
        removeItem(bst, tmp->val);
        // 用 tmp 的值覆寫 cur 的值
        cur->val = tmpVal;
    }
}

/* 主程式 */
int main() {
    /* 初始化二元搜尋樹 */
    int nums[] = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    BinarySearchTree *bst = newBinarySearchTree();
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        insert(bst, nums[i]);
    }
    printf("初始化後的二元樹為\n");
    printTree(getRoot(bst));

    /* 搜尋節點 */
    TreeNode *node = search(bst, 7);
    printf("找到的節點物件，其節點值 = %d\n", node->val);

    /* 插入節點 */
    insert(bst, 16);
    printf("插入節點 16 後的二元樹為\n");
    printTree(getRoot(bst));

    /* 刪除節點 */
    removeItem(bst, 1);
    printf("刪除節點 1 後的二元樹為\n");
    printTree(getRoot(bst));
    removeItem(bst, 2);
    printf("刪除節點 2 後的二元樹為\n");
    printTree(getRoot(bst));
    removeItem(bst, 4);
    printf("刪除節點 4 後的二元樹為\n");
    printTree(getRoot(bst));

    // 釋放記憶體
    delBinarySearchTree(bst);
    return 0;
}
