/**
 * File: avl_tree.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* AVL 木の構造体 */
typedef struct {
    TreeNode *root;
} AVLTree;

/* コンストラクタ */
AVLTree *newAVLTree() {
    AVLTree *tree = (AVLTree *)malloc(sizeof(AVLTree));
    tree->root = NULL;
    return tree;
}

/* デストラクタ */
void delAVLTree(AVLTree *tree) {
    freeMemoryTree(tree->root);
    free(tree);
}

/* ノードの高さを取得する */
int height(TreeNode *node) {
    // 空ノードの高さは -1 、葉ノードの高さは 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* ノードの高さを更新する */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // ノードの高さは、最も高い部分木の高さ + 1
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* 平衡係数を取得する */
int balanceFactor(TreeNode *node) {
    // 空ノードの平衡係数は 0
    if (node == NULL) {
        return 0;
    }
    // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
    return height(node->left) - height(node->right);
}

/* 右回転操作 */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // child を中心に node を右回転する
    child->right = node;
    node->left = grandChild;
    // ノードの高さを更新する
    updateHeight(node);
    updateHeight(child);
    // 回転後の部分木の根ノードを返す
    return child;
}

/* 左回転操作 */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // child を中心に node を左回転する
    child->left = node;
    node->right = grandChild;
    // ノードの高さを更新する
    updateHeight(node);
    updateHeight(child);
    // 回転後の部分木の根ノードを返す
    return child;
}

/* 回転操作によって、この部分木の平衡を回復する */
TreeNode *rotate(TreeNode *node) {
    // ノード node の平衡係数を取得する
    int bf = balanceFactor(node);
    // 左に偏った木
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // 右回転
            return rightRotate(node);
        } else {
            // 左回転してから右回転する
            node->left = leftRotate(node->left);
            return rightRotate(node);
        }
    }
    // 右に偏った木
    if (bf < -1) {
        if (balanceFactor(node->right) <= 0) {
            // 左回転
            return leftRotate(node);
        } else {
            // 右回転してから左回転する
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // 平衡な木なので、回転せずにそのまま返す
    return node;
}

/* ノードを再帰的に挿入する（補助関数） */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. 挿入位置を探してノードを挿入する */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // 重複したノードは挿入せず、そのまま戻る
        return node;
    }
    // ノードの高さを更新する
    updateHeight(node);
    /* 2. 回転操作によって、この部分木の平衡を回復する */
    node = rotate(node);
    // 部分木の根ノードを返す
    return node;
}

/* ノードを挿入する */
void insert(AVLTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
}

/* ノードを再帰的に削除する（補助関数） */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild;
    if (node == NULL) {
        return NULL;
    }
    /* 1. ノードを探して削除する */
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
            // 子ノード数 = 0 の場合、node を削除して戻る
            if (child == NULL) {
                return NULL;
            } else {
                // 子ノード数 = 1 の場合、node を削除する
                node = child;
            }
        } else {
            // 子ノード数 = 2 の場合、通りがけ順で次のノードを削除し、そのノードで現在のノードを置き換える
            TreeNode *temp = node->right;
            while (temp->left != NULL) {
                temp = temp->left;
            }
            int tempVal = temp->val;
            node->right = removeHelper(node->right, temp->val);
            node->val = tempVal;
        }
    }
    // ノードの高さを更新する
    updateHeight(node);
    /* 2. 回転操作によって、この部分木の平衡を回復する */
    node = rotate(node);
    // 部分木の根ノードを返す
    return node;
}

/* ノードを削除する */
// stdio.h を読み込んでいるため、ここでは remove という名前は使えない
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* ノードを探索する */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // 繰り返し探索し、葉ノードを越えたら終了する
    while (cur != NULL) {
        if (cur->val < val) {
            // 目的のノードは cur の右部分木にある
            cur = cur->right;
        } else if (cur->val > val) {
            // 目的のノードは cur の左部分木にある
            cur = cur->left;
        } else {
            // 目的のノードが見つかったので、ループを終了する
            break;
        }
    }
    // 目的のノードが見つかったので、ループを終了する
    return cur;
}

void testInsert(AVLTree *tree, int val) {
    insert(tree, val);
    printf("\nノード %d を挿入した後の AVL 木 \n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\nノード %d を削除した後の AVL 木 \n", val);
    printTree(tree->root);
}

/* 実行用コード */
int main() {
    /* 空の AVL 木を初期化する */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* ノードを挿入する */
    // ノード挿入後、AVL 木がどのように平衡を保つかに注目する
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

    /* 重複したノードを挿入する */
    testInsert(tree, 7);

    /* ノードを削除する */
    // ノード削除後、AVL 木がどのように平衡を保つかに注目する
    testRemove(tree, 8); // 次数 0 のノードを削除する
    testRemove(tree, 5); // 次数 1 のノードを削除する
    testRemove(tree, 4); // 次数 2 のノードを削除する

    /* ノードを探索する */
    TreeNode *node = search(tree, 7);
    printf("\n見つかったノードオブジェクトの値 = %d \n", node->val);

    // メモリを解放する
    delAVLTree(tree);
    return 0;
}
