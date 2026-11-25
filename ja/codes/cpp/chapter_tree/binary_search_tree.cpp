/**
 * File: binary_search_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二分探索木 */
class BinarySearchTree {
  private:
    TreeNode *root;

  public:
    /* コンストラクタ */
    BinarySearchTree() {
        // 空の木を初期化する
        root = nullptr;
    }

    /* デストラクタ */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* 二分木の根を取得する */
    TreeNode *getRoot() {
        return root;
    }

    /* ノードを探索する */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // ループで探索し、葉を越えたら終了する
        while (cur != nullptr) {
            // 目的のノードは cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 目的のノードは cur の左部分木にある
            else if (cur->val > num)
                cur = cur->left;
            // 目的のノードが見つかったのでループを抜ける
            else
                break;
        }
        // 目的のノードを返す
        return cur;
    }

    /* ノードを挿入する */
    void insert(int num) {
        // 木が空なら根を初期化する
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // ループで探索し、葉を越えたら終了する
        while (cur != nullptr) {
            // 値が重複するノードが見つかったらそのまま戻る
            if (cur->val == num)
                return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 挿入位置は cur の左部分木にある
            else
                cur = cur->left;
        }
        // ノードを挿入する
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* ノードを削除する */
    void remove(int num) {
        // 木が空ならすぐに戻る
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // ループで探索し、葉を越えたら終了する
        while (cur != nullptr) {
            // 削除対象のノードが見つかったのでループを抜ける
            if (cur->val == num)
                break;
            pre = cur;
            // 削除対象は cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 削除対象は cur の左部分木にある
            else
                cur = cur->left;
        }
        // 削除対象が見つからなければそのまま戻る
        if (cur == nullptr)
            return;
        // 子が 0 個または 1 個
        if (cur->left == nullptr || cur->right == nullptr) {
            // 子が 0 個なら child = nullptr、1 個なら child はその子
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 削除対象が根なら根を設定し直す
                root = child;
            }
            // メモリを解放する
            delete cur;
        }
        // 子が 2 個
        else {
            // 通りがけ順で cur の次に来るノードを取得する
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // ノード tmp を再帰的に削除する
            remove(tmp->val);
            // tmp の値で cur の値を上書きする
            cur->val = tmpVal;
        }
    }
};

/* 実行例 */
int main() {
    /* 二分探索木を初期化する */
    BinarySearchTree *bst = new BinarySearchTree();
    // 挿入順によって木の形は変わる。この順に挿入すると完璧二分木になる
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "初期化した二分木：\n" << endl;
    printTree(bst->getRoot());

    /* ノードを探索する */
    TreeNode *node = bst->search(7);
    cout << endl << "見つかったノードのオブジェクト： " << node << "、ノードの値 = " << node->val << endl;

    /* ノードを挿入する */
    bst->insert(16);
    cout << endl << "ノード 16 を挿入した後の二分木：\n" << endl;
    printTree(bst->getRoot());

    /* ノードを削除する */
    bst->remove(1);
    cout << endl << "ノード 1 を削除した後の二分木：\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "ノード 2 を削除した後の二分木：\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "ノード 4 を削除した後の二分木：\n" << endl;
    printTree(bst->getRoot());

    // メモリを解放する
    delete bst;

    return 0;
}
