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
        // 空の木を初期化
        root = nullptr;
    }

    /* デストラクタ */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* 二分木のルートノードを取得 */
    TreeNode *getRoot() {
        return root;
    }

    /* ノードを検索 */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // ループで検索、葉ノードを通り過ぎたら終了
        while (cur != nullptr) {
            // 目標ノードはcurの右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 目標ノードはcurの左部分木にある
            else if (cur->val > num)
                cur = cur->left;
            // 目標ノードを見つけた、ループを抜ける
            else
                break;
        }
        // 目標ノードを返す
        return cur;
    }

    /* ノードを挿入 */
    void insert(int num) {
        // 木が空の場合、ルートノードを初期化
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // ループで検索、葉ノードを通り過ぎたら終了
        while (cur != nullptr) {
            // 重複ノードを見つけた場合、戻る
            if (cur->val == num)
                return;
            pre = cur;
            // 挿入位置はcurの右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 挿入位置はcurの左部分木にある
            else
                cur = cur->left;
        }
        // ノードを挿入
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* ノードを削除 */
    void remove(int num) {
        // 木が空の場合、戻る
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // ループで検索、葉ノードを通り過ぎたら終了
        while (cur != nullptr) {
            // 削除するノードを見つけた、ループを抜ける
            if (cur->val == num)
                break;
            pre = cur;
            // 削除するノードはcurの右部分木にある
            if (cur->val < num)
                cur = cur->right;
            // 削除するノードはcurの左部分木にある
            else
                cur = cur->left;
        }
        // 削除するノードがない場合、戻る
        if (cur == nullptr)
            return;
        // 子ノード数 = 0 または 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 子ノード数 = 0 / 1の場合、child = nullptr / その子ノード
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // ノードcurを削除
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 削除されるノードがルートの場合、ルートを再割り当て
                root = child;
            }
            // メモリを解放
            delete cur;
        }
        // 子ノード数 = 2
        else {
            // curの中順走査の次のノードを取得
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // ノードtmpを再帰的に削除
            remove(tmp->val);
            // curをtmpで置き換え
            cur->val = tmpVal;
        }
    }
};

/* ドライバーコード */
int main() {
    /* 二分探索木を初期化 */
    BinarySearchTree *bst = new BinarySearchTree();
    // 異なる挿入順序は様々な木構造を生み出すことに注意。この特定の順序は完全二分木を作成します
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "初期化された二分木は\n" << endl;
    printTree(bst->getRoot());

    /* ノードを検索 */
    TreeNode *node = bst->search(7);
    cout << endl << "見つかったノードオブジェクトは " << node << "、ノード値 =" << node->val << endl;

    /* ノードを挿入 */
    bst->insert(16);
    cout << endl << "ノード 16 を挿入後、二分木は\n" << endl;
    printTree(bst->getRoot());

    /* ノードを削除 */
    bst->remove(1);
    cout << endl << "ノード 1 を削除後、二分木は\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "ノード 2 を削除後、二分木は\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "ノード 4 を削除後、二分木は\n" << endl;
    printTree(bst->getRoot());

    // メモリを解放
    delete bst;

    return 0;
}