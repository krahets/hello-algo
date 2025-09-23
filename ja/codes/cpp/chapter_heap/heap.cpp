/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // 要素をヒープにプッシュ
    cout << "\n要素 " << val << " をヒープに追加後" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\nヒープから先頭要素 " << val << " を削除後" << endl;
    printHeap(heap);
}

/* ドライバーコード */
int main() {
    /* ヒープを初期化 */
    // 最小ヒープを初期化
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // 最大ヒープを初期化
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\n以下のテストケースは最大ヒープ用です" << endl;

    /* ヒープに要素をプッシュ */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* ヒープの先頭要素にアクセス */
    int peek = maxHeap.top();
    cout << "\nヒープの先頭要素は " << peek << endl;

    /* ヒープ先頭の要素をポップ */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* ヒープのサイズを取得 */
    int size = maxHeap.size();
    cout << "\nヒープ内の要素数は " << size << endl;

    /* ヒープが空かどうか判定 */
    bool isEmpty = maxHeap.empty();
    cout << "\nヒープが空かどうか " << isEmpty << endl;

    /* リストを入力してヒープを構築 */
    // 時間計算量はO(n)、O(nlogn)ではない
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "リストを入力して最小ヒープを構築後" << endl;
    printHeap(minHeap);

    return 0;
}