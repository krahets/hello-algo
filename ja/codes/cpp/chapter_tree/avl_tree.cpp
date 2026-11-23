/**
 * File: avl_tree.cpp
 * Created Time: 2023-02-03
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* AVL 木 */
class AVLTree {
  private:
    /* ノードの高さを更新する */
    void updateHeight(TreeNode *node) {
        // ノードの高さは、最も高い部分木の高さ + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }

    /* 右回転操作 */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
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
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
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
        int _balanceFactor = balanceFactor(node);
        // 左に偏った木
        if (_balanceFactor > 1) {
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
        if (_balanceFactor < -1) {
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

    /* ノードを再帰的に挿入する（補助メソッド） */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. 挿入位置を探してノードを挿入する */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // 重複したノードは挿入せず、そのまま戻る
        updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. ノードを探して削除する */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // 子ノード数 = 0 の場合、node を削除して戻る
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // 子ノード数 = 1 の場合、node を削除する
                else {
                    delete node;
                    node = child;
                }
            } else {
                // 子ノード数 = 2 の場合、通りがけ順で次のノードを削除し、そのノードで現在のノードを置き換える
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

  public:
    TreeNode *root; // 根ノード

    /* ノードの高さを取得する */
    int height(TreeNode *node) {
        // 空ノードの高さは -1 、葉ノードの高さは 0
        return node == nullptr ? -1 : node->height;
    }

    /* 平衡係数を取得する */
    int balanceFactor(TreeNode *node) {
        // 空ノードの平衡係数は 0
        if (node == nullptr)
            return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node->left) - height(node->right);
    }

    /* ノードを挿入する */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* ノードを削除する */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* ノードを探索する */
    TreeNode *search(int val) {
        TreeNode *cur = root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != nullptr) {
            // 目的のノードは cur の右部分木にある
            if (cur->val < val)
                cur = cur->right;
            // 目的のノードは cur の左部分木にある
            else if (cur->val > val)
                cur = cur->left;
            // 目的のノードが見つかったので、ループを終了する
            else
                break;
        }
        // 目的のノードを返す
        return cur;
    }

    /*コンストラクタ*/
    AVLTree() : root(nullptr) {
    }

    /*デストラクタ*/
    ~AVLTree() {
        freeMemoryTree(root);
    }
};

void testInsert(AVLTree &tree, int val) {
    tree.insert(val);
    cout << "\nノードの挿入： " << val << " 、操作後の AVL 木" << endl;
    printTree(tree.root);
}

void testRemove(AVLTree &tree, int val) {
    tree.remove(val);
    cout << "\nノードの削除： " << val << " 、操作後の AVL 木" << endl;
    printTree(tree.root);
}

/* 実行用コード */
int main() {
    /* 空の AVL 木を初期化する */
    AVLTree avlTree;

    /* ノードを挿入する */
    // ノード挿入後、AVL 木がどのように平衡を保つかに注目する
    testInsert(avlTree, 1);
    testInsert(avlTree, 2);
    testInsert(avlTree, 3);
    testInsert(avlTree, 4);
    testInsert(avlTree, 5);
    testInsert(avlTree, 8);
    testInsert(avlTree, 7);
    testInsert(avlTree, 9);
    testInsert(avlTree, 10);
    testInsert(avlTree, 6);

    /* 重複したノードを挿入する */
    testInsert(avlTree, 7);

    /* ノードを削除する */
    // ノード削除後、AVL 木がどのように平衡を保つかに注目する
    testRemove(avlTree, 8); // 次数 0 のノードを削除する
    testRemove(avlTree, 5); // 次数 1 のノードを削除する
    testRemove(avlTree, 4); // 次数 2 のノードを削除する

    /* ノードを探索する */
    TreeNode *node = avlTree.search(7);
    cout << "\n見つかったノードオブジェクトは " << node << "、ノードの値 = " << node->val << endl;
}
