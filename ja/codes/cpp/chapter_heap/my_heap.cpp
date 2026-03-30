/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 最大ヒープ */
class MaxHeap {
  private:
    // 動的配列を使うことで、拡張を考慮せずに済む
    vector<int> maxHeap;

    /* 左子ノードのインデックスを取得 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 右子ノードのインデックスを取得 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    int parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }

    /* ノード i から始めて、下から上へヒープ化 */
    void siftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得
            int p = parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」になったらヒープ化を終了
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換
            swap(maxHeap[i], maxHeap[p]);
            // ループで下から上へヒープ化
            i = p;
        }
    }

    /* ノード i から始めて、上から下へヒープ化 */
    void siftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外なら、ヒープ化は不要なので抜ける
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // ループで上から下へヒープ化
            i = ma;
        }
    }

  public:
    /* コンストラクタ。入力リストに基づいてヒープを構築する */
    MaxHeap(vector<int> nums) {
        // リスト要素をそのままヒープに追加
        maxHeap = nums;
        // 葉ノード以外のすべてのノードをヒープ化
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* ヒープのサイズを取得 */
    int size() {
        return maxHeap.size();
    }

    /* ヒープが空かどうかを判定 */
    bool isEmpty() {
        return size() == 0;
    }

    /* ヒープ先頭要素にアクセス */
    int peek() {
        return maxHeap[0];
    }

    /* 要素をヒープに追加 */
    void push(int val) {
        // ノードを追加
        maxHeap.push_back(val);
        // 下から上へヒープ化
        siftUp(size() - 1);
    }

    /* 要素をヒープから取り出す */
    void pop() {
        // 空判定の処理
        if (isEmpty()) {
            throw out_of_range("ヒープが空です");
        }
        // 根ノードと最も右の葉ノードを交換（先頭要素と末尾要素を交換）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // ノードを削除
        maxHeap.pop_back();
        // 上から下へヒープ化
        siftDown(0);
    }

    /* ヒープ（二分木）を出力 */
    void print() {
        cout << "ヒープの配列表現：";
        printVector(maxHeap);
        cout << "ヒープの木構造表現：" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* Driver Code */
int main() {
    /* 最大ヒープを初期化 */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nリストを入力してヒープを構築した後" << endl;
    maxHeap.print();

    /* ヒープ頂点の要素を取得 */
    int peek = maxHeap.peek();
    cout << "\nヒープ先頭要素は " << peek << endl;

    /* 要素をヒープに追加 */
    int val = 7;
    maxHeap.push(val);
    cout << "\n要素 " << val << " をヒープに追加した後" << endl;
    maxHeap.print();

    /* ヒープ頂点の要素を取り出す */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nヒープの先頭要素 " << peek << " を取り出した後" << endl;
    maxHeap.print();

    /* ヒープのサイズを取得 */
    int size = maxHeap.size();
    cout << "\nヒープ要素数は " << size << endl;

    /* ヒープが空かどうかを判定 */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nヒープが空かどうかは " << isEmpty << endl;

    return 0;
}
