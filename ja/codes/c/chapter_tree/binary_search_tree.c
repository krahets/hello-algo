/**
 * File: binary_search_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 二分探索木の構造体 */
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

/* 二分木の根を取得する */
TreeNode *getRoot(BinarySearchTree *bst) {
    return bst->root;
}

/* ノードを探索する */
TreeNode *search(BinarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // ループで探索し、葉を越えたら終了する
    while (cur != NULL) {
        if (cur->val < num) {
            // 目的のノードは cur の右部分木にある
            cur = cur->right;
        } else if (cur->val > num) {
            // 目的のノードは cur の左部分木にある
            cur = cur->left;
        } else {
            // 目的のノードが見つかったのでループを抜ける
            break;
        }
    }
    // 目的のノードを返す
    return cur;
}

/* ノードを挿入する */
void insert(BinarySearchTree *bst, int num) {
    // 木が空なら根を初期化する
    if (bst->root == NULL) {
        bst->root = newTreeNode(num);
        return;
    }
    TreeNode *cur = bst->root, *pre = NULL;
    // ループで探索し、葉を越えたら終了する
    while (cur != NULL) {
        // 値が重複するノードが見つかったらそのまま戻る
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
    // ノードを挿入する
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* ノードを削除する */
// stdio.h をインクルードしているため、ここでは remove という名前は使えない
void removeItem(BinarySearchTree *bst, int num) {
    // 木が空ならすぐに戻る
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // ループで探索し、葉を越えたら終了する
    while (cur != NULL) {
        // 削除対象のノードが見つかったのでループを抜ける
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // 削除対象は root の右部分木にある
            cur = cur->right;
        } else {
            // 削除対象は root の左部分木にある
            cur = cur->left;
        }
    }
    // 削除対象が見つからなければそのまま戻る
    if (cur == NULL)
        return;
    // 削除対象のノードに子があるか調べる
    if (cur->left == NULL || cur->right == NULL) {
        /* 子が 0 個または 1 個 */
        // 子が 0 個なら child = nullptr、1 個なら child はその子
        TreeNode *child = cur->left != NULL ? cur->left : cur->right;
        // ノード cur を削除する
        if (pre == NULL) {
            bst->root = child;
        } else if (pre->left == cur) {
            pre->left = child;
        } else {
            pre->right = child;
        }
        // メモリを解放する
        free(cur);
    } else {
        /* 子が 2 個 */
        // 通りがけ順で cur の次に来るノードを取得する
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // ノード tmp を再帰的に削除する
        removeItem(bst, tmp->val);
        // tmp の値で cur の値を上書きする
        cur->val = tmpVal;
    }
}

/* 実行例 */
int main() {
    /* 二分探索木を初期化する */
    int nums[] = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    BinarySearchTree *bst = newBinarySearchTree();
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        insert(bst, nums[i]);
    }
    printf("初期化した二分木：\n");
    printTree(getRoot(bst));

    /* ノードを探索する */
    TreeNode *node = search(bst, 7);
    printf("見つかったノードの値 = %d\n", node->val);

    /* ノードを挿入する */
    insert(bst, 16);
    printf("ノード 16 を挿入した後の二分木：\n");
    printTree(getRoot(bst));

    /* ノードを削除する */
    removeItem(bst, 1);
    printf("ノード 1 を削除した後の二分木：\n");
    printTree(getRoot(bst));
    removeItem(bst, 2);
    printf("ノード 2 を削除した後の二分木：\n");
    printTree(getRoot(bst));
    removeItem(bst, 4);
    printf("ノード 4 を削除した後の二分木：\n");
    printTree(getRoot(bst));

    // メモリを解放する
    delBinarySearchTree(bst);
    return 0;
}
