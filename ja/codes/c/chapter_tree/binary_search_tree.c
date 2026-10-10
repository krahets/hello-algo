/**
 * File: binary_search_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 二分探索木構造体 */
typedef struct {
    TreeNode *root;
} BinarySearchTree;

/* コンストラクタ */
BinarySearchTree *newBinarySearchTree() {
    // 空の木を初期化する
    BinarySearchTree *bst = (BinarySearchTree *)malloc(sizeof(BinarySearchTree));
    bst->root = NULL;
    return bst;
}

/* デストラクタ */
void delBinarySearchTree(BinarySearchTree *bst) {
    freeMemoryTree(bst->root);
    free(bst);
}

/* 二分木の根ノードを取得 */
TreeNode *getRoot(BinarySearchTree *bst) {
    return bst->root;
}

/* ノードを探索 */
TreeNode *search(BinarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // ループで探索し、葉ノードを越えたら抜ける
    while (cur != NULL) {
        if (cur->val < num) {
            // 目標ノードは cur の右部分木にある
            cur = cur->right;
        } else if (cur->val > num) {
            // 目標ノードは cur の左部分木にある
            cur = cur->left;
        } else {
            // 目標ノードが見つかったらループを抜ける
            break;
        }
    }
    // 目標ノードを返す
    return cur;
}

/* ノードを挿入 */
void insert(BinarySearchTree *bst, int num) {
    // 木が空なら、根ノードを初期化する
    if (bst->root == NULL) {
        bst->root = newTreeNode(num);
        return;
    }
    TreeNode *cur = bst->root, *pre = NULL;
    // ループで探索し、葉ノードを越えたら抜ける
    while (cur != NULL) {
        // 重複ノードが見つかったら、直ちに返す
        if (cur->val == num) {
            return;
        }
        pre = cur;
        if (cur->val < num) {
            // 挿入位置は cur の右部分木にある
            cur = cur->right;
        } else {
            // 挿入位置は cur の左部分木にある
            cur = cur->left;
        }
    }
    // ノードを挿入
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* ノードを削除 */
// stdio.h を導入しているため、ここでは remove 識別子を使えない
void removeItem(BinarySearchTree *bst, int num) {
    // 木が空なら、そのまま早期リターンする
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // ループで探索し、葉ノードを越えたら抜ける
    while (cur != NULL) {
        // 削除対象のノードが見つかったら、ループを抜ける
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // 削除対象ノードは root の右部分木にある
            cur = cur->right;
        } else {
            // 削除対象ノードは root の左部分木にある
            cur = cur->left;
        }
    }
    // 削除対象ノードがなければそのまま返す
    if (cur == NULL)
        return;
    // 削除対象ノードに子ノードがあるかを判定する
    if (cur->left == NULL || cur->right == NULL) {
        /* 子ノード数 = 0 or 1 */
        // 子ノード数 = 0 / 1 のとき、child = nullptr / その子ノード
        TreeNode *child = cur->left != NULL ? cur->left : cur->right;
        // ノード cur を削除する
        if (pre->left == cur) {
            pre->left = child;
        } else {
            pre->right = child;
        }
        // メモリを解放する
        free(cur);
    } else {
        /* 子ノード数 = 2 */
        // 中順走査における cur の次ノードを取得
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // ノード tmp を再帰的に削除
        removeItem(bst, tmp->val);
        // tmp で cur を上書きする
        cur->val = tmpVal;
    }
}

/* Driver Code */
int main() {
    /* 二分探索木を初期化 */
    int nums[] = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    BinarySearchTree *bst = newBinarySearchTree();
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        insert(bst, nums[i]);
    }
    printf("初期化した二分木は\n");
    printTree(getRoot(bst));

    /* ノードを探索 */
    TreeNode *node = search(bst, 7);
    printf("見つかったノードオブジェクトのノード値 = %d\n", node->val);

    /* ノードを挿入 */
    insert(bst, 16);
    printf("ノード 16 を挿入した後、二分木は\n");
    printTree(getRoot(bst));

    /* ノードを削除 */
    removeItem(bst, 1);
    printf("ノード 1 を削除した後、二分木は\n");
    printTree(getRoot(bst));
    removeItem(bst, 2);
    printf("ノード 2 を削除した後、二分木は\n");
    printTree(getRoot(bst));
    removeItem(bst, 4);
    printf("ノード 4 を削除した後、二分木は\n");
    printTree(getRoot(bst));

    // メモリを解放する
    delBinarySearchTree(bst);
    return 0;
}
