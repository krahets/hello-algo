/**
 * File: avl_tree.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* AVL 木構造体 */
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

/* ノードの高さを取得 */
int height(TreeNode *node) {
    // 空ノードの高さは -1、葉ノードの高さは 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* ノードの高さを更新する */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // ノードの高さは最も高い部分木の高さ + 1 に等しい
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* 平衡係数を取得 */
int balanceFactor(TreeNode *node) {
    // 空ノードの平衡係数は 0
    if (node == NULL) {
        return 0;
    }
    // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
    return height(node->left) - height(node->right);
}

/* 右回転 */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // child を支点として node を右回転させる
    child->right = node;
    node->left = grandChild;
    // ノードの高さを更新する
    updateHeight(node);
    updateHeight(child);
    // 回転後の部分木の根ノードを返す
    return child;
}

/* 左回転 */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // child を支点として node を左回転させる
    child->left = node;
    node->right = grandChild;
    // ノードの高さを更新する
    updateHeight(node);
    updateHeight(child);
    // 回転後の部分木の根ノードを返す
    return child;
}

/* 回転操作を行い、この部分木の平衡を回復する */
TreeNode *rotate(TreeNode *node) {
    // ノード node の平衡係数を取得
    int bf = balanceFactor(node);
    // 左に偏った木
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // 右回転
            return rightRotate(node);
        } else {
            // 左回転してから右回転
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
            // 右回転してから左回転
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // 平衡木なので回転不要、そのまま返す
    return node;
}

/* ノードを再帰的に挿入する（補助関数） */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. 挿入位置を探索してノードを挿入 */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // 重複ノードは挿入せず、そのまま返す
        return node;
    }
    // ノードの高さを更新する
    updateHeight(node);
    /* 2. 回転操作を行い、部分木の平衡を回復する */
    node = rotate(node);
    // 部分木の根ノードを返す
    return node;
}

/* ノードを挿入 */
void insert(AVLTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
}

/* ノードを再帰的に削除する（補助関数） */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild;
    if (node == NULL) {
        return NULL;
    }
    /* 1. ノードを探索して削除 */
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
            // 子ノード数 = 0 の場合、node をそのまま削除して返す
            if (child == NULL) {
                return NULL;
            } else {
                // 子ノード数 = 1 の場合、node をそのまま削除する
                node = child;
            }
        } else {
            // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
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
    /* 2. 回転操作を行い、部分木の平衡を回復する */
    node = rotate(node);
    // 部分木の根ノードを返す
    return node;
}

/* ノードを削除 */
// stdio.h を導入しているため、ここでは remove 識別子を使えない
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* ノードを探索 */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // ループで探索し、葉ノードを越えたら抜ける
    while (cur != NULL) {
        if (cur->val < val) {
            // 目標ノードは cur の右部分木にある
            cur = cur->right;
        } else if (cur->val > val) {
            // 目標ノードは cur の左部分木にある
            cur = cur->left;
        } else {
            // 目標ノードが見つかったらループを抜ける
            break;
        }
    }
    // 目標ノードが見つかったらループを抜ける
    return cur;
}

void testInsert(AVLTree *tree, int val) {
    insert(tree, val);
    printf("\nノード %d を挿入した後、AVL 木は \n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\nノード %d を削除した後、AVL 木は \n", val);
    printTree(tree->root);
}

/* Driver Code */
int main() {
    /* 空の AVL 木を初期化する */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* ノードを挿入 */
    // ノード挿入後に AVL 木がどのように平衡を保つかに注目してほしい
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

    /* 重複ノードを挿入する */
    testInsert(tree, 7);

    /* ノードを削除 */
    // ノード削除後に AVL 木がどのように平衡を保つかに注目してほしい
    testRemove(tree, 8); // 次数 0 のノードを削除する
    testRemove(tree, 5); // 次数 1 のノードを削除する
    testRemove(tree, 4); // 次数 2 のノードを削除する

    /* ノードを検索 */
    TreeNode *node = search(tree, 7);
    printf("\n見つかったノードオブジェクトのノード値 = %d \n", node->val);

    // メモリを解放する
    delAVLTree(tree);
    return 0;
}
