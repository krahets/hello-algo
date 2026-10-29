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

    /* 二分木の根ノードを取得する */
    TreeNode *getRoot() {
        return root;
    }

    /* ノードを探索する */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != nullptr) {
            // 目的のノードは cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 目的のノードは cur の左部分木にある
            else if (cur->val > num)
                cur = cur->left;
            // 目的のノードが見つかったので、ループを終了する
            else
                break;
        }
        // 目的のノードを返す
        return cur;
    }

    /* ノードを挿入する */
    void insert(int num) {
        // 木が空の場合、根ノードを初期化する
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != nullptr) {
            // 重複したノードが見つかったので、そのまま戻る
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
        // 木が空の場合、そのまま早期リターンする
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != nullptr) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur->val == num)
                break;
            pre = cur;
            // 削除対象のノードは cur の右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 削除対象のノードは cur の左部分木にある
            else
                cur = cur->left;
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur == nullptr)
            return;
        // 子ノード数 = 0 または 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 子ノード数 = 0 / 1 の場合、child = nullptr / その子ノード
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                root = child;
            }
            // メモリを解放する
            delete cur;
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // ノード tmp を再帰的に削除する
            remove(tmp->val);
            // tmp で cur を上書きする
            cur->val = tmpVal;
        }
    }
};

/* 実行用コード */
int main() {
    /* 二分探索木を初期化する */
    BinarySearchTree *bst = new BinarySearchTree();
    // 挿入順序が異なると異なる二分木になることに注意。この順序ではパーフェクト二分木を生成できる
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "初期化した二分木\n" << endl;
    printTree(bst->getRoot());

    /* ノードを探索する */
    TreeNode *node = bst->search(7);
    cout << endl << "見つかったノードオブジェクトは " << node << "、ノードの値 = " << node->val << endl;

    /* ノードを挿入する */
    bst->insert(16);
    cout << endl << "ノード 16 を挿入した後の二分木\n" << endl;
    printTree(bst->getRoot());

    /* ノードを削除する */
    bst->remove(1);
    cout << endl << "ノード 1 を削除した後の二分木\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "ノード 2 を削除した後の二分木\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "ノード 4 を削除した後の二分木\n" << endl;
    printTree(bst->getRoot());

    // メモリを解放する
    delete bst;

    return 0;
}
