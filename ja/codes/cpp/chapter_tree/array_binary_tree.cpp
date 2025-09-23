/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 配列ベースの二分木クラス */
class ArrayBinaryTree {
  public:
    /* コンストラクタ */
    ArrayBinaryTree(vector<int> arr) {
        tree = arr;
    }

    /* リストの容量 */
    int size() {
        return tree.size();
    }

    /* インデックス i のノードの値を取得 */
    int val(int i) {
        // インデックスが範囲外の場合、INT_MAX を返す（null を表す）
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* インデックス i のノードの左の子のインデックスを取得 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* インデックス i のノードの右の子のインデックスを取得 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* インデックス i のノードの親のインデックスを取得 */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* レベル順走査 */
    vector<int> levelOrder() {
        vector<int> res;
        // 配列を走査
        for (int i = 0; i < size(); i++) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    /* 前順走査 */
    vector<int> preOrder() {
        vector<int> res;
        dfs(0, "pre", res);
        return res;
    }

    /* 中順走査 */
    vector<int> inOrder() {
        vector<int> res;
        dfs(0, "in", res);
        return res;
    }

    /* 後順走査 */
    vector<int> postOrder() {
        vector<int> res;
        dfs(0, "post", res);
        return res;
    }

  private:
    vector<int> tree;

    /* 深さ優先走査 */
    void dfs(int i, string order, vector<int> &res) {
        // 空の位置の場合、戻る
        if (val(i) == INT_MAX)
            return;
        // 前順走査
        if (order == "pre")
            res.push_back(val(i));
        dfs(left(i), order, res);
        // 中順走査
        if (order == "in")
            res.push_back(val(i));
        dfs(right(i), order, res);
        // 後順走査
        if (order == "post")
            res.push_back(val(i));
    }
};

/* ドライバーコード */
int main() {
    // 二分木を初期化
    // INT_MAX を使用して空の位置 nullptr を表す
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\n二分木を初期化\n";
    cout << "二分木の配列表現:\n";
    printVector(arr);
    cout << "二分木の連結リスト表現:\n";
    printTree(root);

    // 配列ベースの二分木クラス
    ArrayBinaryTree abt(arr);

    // ノードにアクセス
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\n現在のノードのインデックスは " << i << "、値 = " << abt.val(i) << "\n";
    cout << "その左の子のインデックスは " << l << "、値 = " << (l != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "その右の子のインデックスは " << r << "、値 = " << (r != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "その親のインデックスは " << p << "、値 = " << (p != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // 木を走査
    vector<int> res = abt.levelOrder();
    cout << "\nレベル順走査は:";
    printVector(res);
    res = abt.preOrder();
    cout << "前順走査は:";
    printVector(res);
    res = abt.inOrder();
    cout << "中順走査は:";
    printVector(res);
    res = abt.postOrder();
    cout << "後順走査は:";
    printVector(res);

    return 0;
}