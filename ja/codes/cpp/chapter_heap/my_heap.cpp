/**
 * File: my_heap.cpp
 * Created Time: 2023-02-04
 * Author: LoneRanger (836253168@qq.com), what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* 最大ヒープ */
class MaxHeap {
  private:
    // 動的配列を使用してサイズ変更の必要性を回避
    vector<int> maxHeap;

    /* 左の子ノードのインデックスを取得 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 右の子ノードのインデックスを取得 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 親ノードのインデックスを取得 */
    int parent(int i) {
        return (i - 1) / 2; // 整数除算で切り下げ
    }

    /* ノードiから上向きにヒープ化を開始 */
    void siftUp(int i) {
        while (true) {
            // ノードiの親ノードを取得
            int p = parent(i);
            // 「ルートノードを超える」または「ノードが修復不要」の場合、ヒープ化を終了
            if (p < 0 || maxHeap[i] <= maxHeap[p])
                break;
            // 2つのノードを交換
            swap(maxHeap[i], maxHeap[p]);
            // 上向きにループしてヒープ化
            i = p;
        }
    }

    /* ノードiから下向きにヒープ化を開始 */
    void siftDown(int i) {
        while (true) {
            // i、l、rの中で最大のノードを決定し、maとして記録
            int l = left(i), r = right(i), ma = i;
            if (l < size() && maxHeap[l] > maxHeap[ma])
                ma = l;
            if (r < size() && maxHeap[r] > maxHeap[ma])
                ma = r;
            // ノードiが最大、またはインデックスl、rが範囲外の場合、これ以上のヒープ化は不要、ブレーク
            if (ma == i)
                break;
            swap(maxHeap[i], maxHeap[ma]);
            // 下向きにループしてヒープ化
            i = ma;
        }
    }

  public:
    /* コンストラクタ、入力リストに基づいてヒープを構築 */
    MaxHeap(vector<int> nums) {
        // すべてのリスト要素をヒープに追加
        maxHeap = nums;
        // 葉以外のすべてのノードをヒープ化
        for (int i = parent(size() - 1); i >= 0; i--) {
            siftDown(i);
        }
    }

    /* ヒープのサイズを取得 */
    int size() {
        return maxHeap.size();
    }

    /* ヒープが空かどうか判定 */
    bool isEmpty() {
        return size() == 0;
    }

    /* ヒープの先頭要素にアクセス */
    int peek() {
        return maxHeap[0];
    }

    /* ヒープに要素をプッシュ */
    void push(int val) {
        // ノードを追加
        maxHeap.push_back(val);
        // 下から上へヒープ化
        siftUp(size() - 1);
    }

    /* 要素がヒープから退出 */
    void pop() {
        // 空の処理
        if (isEmpty()) {
            throw out_of_range("Heap is empty");
        }
        // ルートノードを最も右の葉ノードと交換（最初の要素と最後の要素を交換）
        swap(maxHeap[0], maxHeap[size() - 1]);
        // ノードを削除
        maxHeap.pop_back();
        // 上から下へヒープ化
        siftDown(0);
    }

    /* ヒープを印刷（二分木）*/
    void print() {
        cout << "ヒープの配列表現:";
        printVector(maxHeap);
        cout << "ヒープの木表現:" << endl;
        TreeNode *root = vectorToTree(maxHeap);
        printTree(root);
        freeMemoryTree(root);
    }
};

/* ドライバーコード */
int main() {
    /* 最大ヒープを初期化 */
    vector<int> vec{9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2};
    MaxHeap maxHeap(vec);
    cout << "\nリストを入力してヒープを構築" << endl;
    maxHeap.print();

    /* ヒープの先頭要素にアクセス */
    int peek = maxHeap.peek();
    cout << "\nヒープの先頭要素は " << peek << endl;

    /* ヒープに要素をプッシュ */
    int val = 7;
    maxHeap.push(val);
    cout << "\n要素 " << val << " をヒープに追加後" << endl;
    maxHeap.print();

    /* ヒープ先頭の要素をポップ */
    peek = maxHeap.peek();
    maxHeap.pop();
    cout << "\nヒープから先頭要素 " << peek << " を削除後" << endl;
    maxHeap.print();

    /* ヒープのサイズを取得 */
    int size = maxHeap.size();
    cout << "\nヒープ内の要素数は " << size << endl;

    /* ヒープが空かどうか判定 */
    bool isEmpty = maxHeap.isEmpty();
    cout << "\nヒープが空かどうか " << isEmpty << endl;

    return 0;
}