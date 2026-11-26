/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 最大ヒープ */
class MaxHeap {
  private:
    // 動的配列を使えば、容量の拡張を自分で扱う必要がない
    vector<int> maxHeap;

    /* 左の子のインデックスを取得する */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 右の子のインデックスを取得する */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 親のインデックスを取得する */
    int parent(int i) {
        return (i - 1) / 2; // 商を 0 方向に丸める
    }

    /* ノード i から上に向かってヒープ化する */
    void siftUp(int i) {
        while (true) {
            // ノード i の親を取得する
            int p = parent(i);
            // 根を越えるか、ノードを調整する必要がなくなれば、ヒープ化を終える
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2 つのノードを交換する
            swap(maxHeap[i], maxHeap[p]);
            // 上へのヒープ化を繰り返す
            i = p;
        }
    }

    /* ノード i から下に向かってヒープ化する */
    void siftDown(int i) {
        while (true) {
            // ノード i、l、r のうち値が最大のものを ma とする
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // ノード i が最大か、インデックス l と r がともに範囲外なら、ヒープ化を終えてループを抜ける
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 下へのヒープ化を繰り返す
            i = ma;
        }
    }

  public:
    /* 入力リストからヒープを構築するコンストラクタ */
    MaxHeap(vector<int> nums) {
        // リストの要素をそのままヒープに追加する
        maxHeap = nums;
        // 葉以外のすべてのノードをヒープ化する
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* ヒープのサイズを取得する */
    int size() {
        return maxHeap.size();
    }

    /* ヒープが空か判定する */
    bool isEmpty() {
        return size() == 0;
    }

    /* ヒープの根の要素を参照する */
    int peek() {
        return maxHeap[0];
    }

    /* 要素をヒープに挿入する */
    void push(int val) {
        // ノードを追加する
        maxHeap.push_back(val);
        // 上に向かってヒープ化する
        siftUp(size() - 1);
    }

    /* 根の要素をヒープから取り出す */
    void pop() {
        // 空の場合の処理
        if (isEmpty()) {
            throw out_of_range("ヒープが空です");
        }
        // 根と最も右の葉（先頭要素と末尾要素）を交換する
        swap(maxHeap[0], maxHeap[size() - 1]);
        // ノードを削除する
        maxHeap.pop_back();
        // 下に向かってヒープ化する
        siftDown(0);
    }

    /* ヒープを二分木として表示する*/
    void print() {
        cout << "ヒープの配列表現：";
        printVector(maxHeap);
        cout << "ヒープの木構造：" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* 実行例 */
int main() {
    /* 最大ヒープを初期化する */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\n入力リストから構築したヒープ：" << endl;
    maxHeap.print();

    /* ヒープの根の要素を取得する */
    int peek = maxHeap.peek();
    cout << "\nヒープの根の要素： " << peek << endl;

    /* 要素をヒープに挿入する */
    int val = 7;
    maxHeap.push(val);
    cout << "\n要素 " << val << " を挿入した後：" << endl;
    maxHeap.print();

    /* 根の要素を取り出す */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\n根の要素 " << peek << " を取り出した後：" << endl;
    maxHeap.print();

    /* ヒープのサイズを取得する */
    int size = maxHeap.size();
    cout << "\nヒープの要素数： " << size << endl;

    /* ヒープが空か判定する */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nヒープは空か： " << isEmpty << endl;

    return 0;
}
