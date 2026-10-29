/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // ヒープに要素を挿入する
    cout << "\n要素 " << val << " をヒープに挿入した後" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\nヒープの先頭要素 " << val << " を取り出した後" << endl;
    printHeap(heap);
}

/* 実行用コード */
int main() {
    /* ヒープを初期化する */
    // 最小ヒープを初期化する
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // 最大ヒープを初期化する
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\n以下のテストケースは最大ヒープを対象とする" << endl;

    /* ヒープに要素を挿入する */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* ヒープの先頭要素を取得する */
    int peek = maxHeap.top();
    cout << "\nヒープの先頭要素は " << peek << endl;

    /* ヒープの先頭要素を取り出す */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* ヒープのサイズを取得する */
    int size = maxHeap.size();
    cout << "\nヒープの要素数は " << size << endl;

    /* ヒープが空か判定 */
    bool isEmpty = maxHeap.empty();
    cout << "\nヒープは空か " << isEmpty << endl;

    /* リストを入力してヒープを構築する */
    // 時間計算量は O(n) であり、O(nlogn) ではない
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "リストを入力して最小ヒープを構築した後" << endl;
    printHeap(minHeap);

    return 0;
}
