/**
 * File: avl_tree.cpp
 * Created Time: 2023-02-03
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* AVL木 */
class AVLTree {
  private:
    /* ノードの高さを更新 */
    void updateHeight(TreeNode *node) {
        // ノードの高さ = 最も高い部分木の高さ + 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }

    /* 右回転操作 */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
        // childを中心にnodeを右に回転
        child->right = node;
        node->left = grandChild;
        // ノードの高さを更新
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木のルートを返す
        return child;
    }

    /* 左回転操作 */
    TreeNode *leftRotate(TreeNode *node) {
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
        // childを中心にnodeを左に回転
        child->left = node;
        node->right = grandChild;
        // ノードの高さを更新
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木のルートを返す
        return child;
    }

    /* 回転操作を実行して部分木の平衡を回復 */
    TreeNode *rotate(TreeNode *node) {
        // nodeの平衡因子を取得
        int _balanceFactor = balanceFactor(node);
        // 左に傾いた木
        if (_balanceFactor > 1) {
            if (balanceFactor(node->left) >= 0) {
                // 右回転
                return rightRotate(node);
            } else {
                // 先に左回転、その後右回転
                node->left = leftRotate(node->left);
                return rightRotate(node);
            }
        }
        // 右に傾いた木
        if (_balanceFactor < -1) {
            if (balanceFactor(node->right) <= 0) {
                // 左回転
                return leftRotate(node);
            } else {
                // 先に右回転、その後左回転
                node->right = rightRotate(node->right);
                return leftRotate(node);
            }
        }
        // 平衡な木、回転不要、そのまま戻る
        return node;
    }

    /* ノードを再帰的に挿入（ヘルパーメソッド） */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. 挿入位置を見つけてノードを挿入 */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // 重複ノードは挿入しない、そのまま戻る
        updateHeight(node); // ノードの高さを更新
        /* 2. 回転操作を実行して部分木の平衡を回復 */
        node = rotate(node);
        // 部分木のルートノードを返す
        return node;
    }

    /* ノードを再帰的に削除（ヘルパーメソッド） */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. ノードを見つけて削除 */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // 子ノード数 = 0、ノードを削除して戻る
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // 子ノード数 = 1、ノードを削除
                else {
                    delete node;
                    node = child;
                }
            } else {
                // 子ノード数 = 2、中順走査の次のノードを削除し、現在のノードと置き換える
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // ノードの高さを更新
        /* 2. 回転操作を実行して部分木の平衡を回復 */
        node = rotate(node);
        // 部分木のルートノードを返す
        return node;
    }

  public:
    TreeNode *root; // ルートノード

    /* ノードの高さを取得 */
    int height(TreeNode *node) {
        // 空ノードの高さは-1、葉ノードの高さは0
        return node == nullptr ? -1 : node->height;
    }

    /* 平衡因子を取得 */
    int balanceFactor(TreeNode *node) {
        // 空ノードの平衡因子は0
        if (node == nullptr)
            return 0;
        // ノードの平衡因子 = 左部分木の高さ - 右部分木の高さ
        return height(node->left) - height(node->right);
    }

    /* ノードを挿入 */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* ノードを削除 */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* ノードを検索 */
    TreeNode *search(int val) {
        TreeNode *cur = root;
        // ループで検索、葉ノードを通り過ぎたら終了
        while (cur != nullptr) {
            // 目標ノードはcurの右部分木にある
            if (cur->val < val)
                cur = cur->right;
            // 目標ノードはcurの左部分木にある
            else if (cur->val > val)
                cur = cur->left;
            // 目標ノードを見つけた、ループを抜ける
            else
                break;
        }
        // 目標ノードを返す
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
    cout << "\nノード " << val << " を挿入後、AVL木は" << endl;
    printTree(tree.root);
}

void testRemove(AVLTree &tree, int val) {
    tree.remove(val);
    cout << "\nノード " << val << " を削除後、AVL木は" << endl;
    printTree(tree.root);
}

/* ドライバーコード */
int main() {
    /* 空のAVL木を初期化 */
    AVLTree avlTree;

    /* ノードを挿入 */
    // AVL木がノード挿入後に平衡を維持する様子に注目
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

    /* 重複ノードを挿入 */
    testInsert(avlTree, 7);

    /* ノードを削除 */
    // AVL木がノード削除後に平衡を維持する様子に注目
    testRemove(avlTree, 8); // 次数0のノードを削除
    testRemove(avlTree, 5); // 次数1のノードを削除
    testRemove(avlTree, 4); // 次数2のノードを削除

    /* ノードを検索 */
    TreeNode *node = avlTree.search(7);
    cout << "\n見つかったノードオブジェクトは " << node << "、ノード値 =" << node->val << endl;
}