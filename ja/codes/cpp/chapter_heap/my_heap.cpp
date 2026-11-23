/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 最大ヒープ */
class MaxHeap {
  private:
    // 動的配列を使うため、容量の拡張を考慮する必要がない
    vector<int> maxHeap;

    /* 左の子のインデックスを取得 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得 */
    int parent(int i) {
        return (i - 1) / 2; // 切り捨て除算
    }

    /* ノード i から上向きにヒープ化する */
    void siftUp(int i) {
        while (true) {
            // ノード i の親ノードを取得する
            int p = parent(i);
            // 「根ノードを越えた」または「ノードの修復が不要」の場合、ヒープ化を終了する
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換する
            swap(maxHeap[i], maxHeap[p]);
            // 上向きのヒープ化を繰り返す
            i = p;
        }
    }

    /* ノード i から下向きにヒープ化する */
    void siftDown(int i) {
        while (true) {
            // ノード i, l, r のうち値が最大のノードを求め、ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // ノード i が最大か添字 l, r が範囲外なら、ヒープ化は不要なので終了
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 下向きのヒープ化を繰り返す
            i = ma;
        }
    }

  public:
    /* コンストラクタ：入力リストからヒープを構築する */
    MaxHeap(vector<int> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = nums;
        // 葉ノード以外の全ノードをヒープ化する
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* ヒープのサイズを取得する */
    int size() {
        return maxHeap.size();
    }

    /* ヒープが空か判定 */
    bool isEmpty() {
        return size() == 0;
    }

    /* ヒープの先頭要素にアクセスする */
    int peek() {
        return maxHeap[0];
    }

    /* ヒープに要素を挿入する */
    void push(int val) {
        // ノードを追加する
        maxHeap.push_back(val);
        // 下から上へヒープ化する
        siftUp(size() - 1);
    }

    /* ヒープから要素を取り出す */
    void pop() {
        // 空かどうかを確認する
        if (isEmpty()) {
            throw out_of_range("ヒープが空です");
        }
        // 根と最右の葉を交換（先頭要素と末尾要素を交換）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // ノードを削除する
        maxHeap.pop_back();
        // 上から下へヒープ化する
        siftDown(0);
    }

    /* ヒープ（二分木）を表示する*/
    void print() {
        cout << "ヒープの配列表現：";
        printVector(maxHeap);
        cout << "ヒープの木構造表現：" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* 実行用コード */
int main() {
    /* 最大ヒープを初期化する */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nリストを入力してヒープを構築した後" << endl;
    maxHeap.print();

    /* ヒープの先頭要素を取得する */
    int peek = maxHeap.peek();
    cout << "\nヒープの先頭要素は " << peek << endl;

    /* ヒープに要素を挿入する */
    int val = 7;
    maxHeap.push(val);
    cout << "\n要素 " << val << " をヒープに挿入した後" << endl;
    maxHeap.print();

    /* ヒープの先頭要素を取り出す */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nヒープの先頭要素 " << peek << " を取り出した後" << endl;
    maxHeap.print();

    /* ヒープのサイズを取得する */
    int size = maxHeap.size();
    cout << "\nヒープの要素数は " << size << endl;

    /* ヒープが空か判定 */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nヒープは空か " << isEmpty << endl;

    return 0;
}
