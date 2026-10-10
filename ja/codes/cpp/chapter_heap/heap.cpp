/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // 要素をヒープに追加
    cout << "\n要素 " << val << " をヒープに追加した後" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\nヒープ先頭要素 " << val << " を取り出した後" << endl;
    printHeap(heap);
}

/* Driver Code */
int main() {
    /* ヒープを初期化 */
    // 最小ヒープを初期化する
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // 最大ヒープを初期化する
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\n以下のテスト例は最大ヒープです" << endl;

    /* 要素をヒープに追加 */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* ヒープ頂点の要素を取得 */
    int peek = maxHeap.top();
    cout << "\nヒープ先頭要素は " << peek << endl;

    /* ヒープ頂点の要素を取り出す */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* ヒープのサイズを取得 */
    int size = maxHeap.size();
    cout << "\nヒープ要素数は " << size << endl;

    /* ヒープが空かどうかを判定 */
    bool isEmpty = maxHeap.empty();
    cout << "\nヒープが空かどうかは " << isEmpty << endl;

    /* リストを入力してヒープを構築 */
    // 時間計算量は O(n) であり、O(nlogn) ではない
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "リストを入力して最小ヒープを構築した後" << endl;
    printHeap(minHeap);

    return 0;
}
