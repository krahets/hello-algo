/**
 * File: heap.cpp
 * Created Time: 2023-01-19
 * Author: LoneRanger(836253168@qq.com)
 */

#include "../utils/common.hpp"

void testPush(priority_queue<int> &heap, int val) {
    heap.push(val); // 要素をヒープに挿入する
    cout << "\n要素 " << val << " を挿入した後：" << endl;
    printHeap(heap);
}

void testPop(priority_queue<int> &heap) {
    int val = heap.top();
    heap.pop();
    cout << "\n根の要素 " << val << " を取り出した後：" << endl;
    printHeap(heap);
}

/* 実行例 */
int main() {
    /* ヒープを初期化する */
    // 最小ヒープを初期化する
    // priority_queue<int, vector<int>, greater<int>> minHeap;
    // 最大ヒープを初期化する
    priority_queue<int, vector<int>, less<int>> maxHeap;

    cout << "\n以下は最大ヒープのテスト例" << endl;

    /* 要素をヒープに挿入する */
    testPush(maxHeap, 1);
    testPush(maxHeap, 3);
    testPush(maxHeap, 2);
    testPush(maxHeap, 5);
    testPush(maxHeap, 4);

    /* ヒープの根の要素を取得する */
    int peek = maxHeap.top();
    cout << "\nヒープの根の要素： " << peek << endl;

    /* 根の要素を取り出す */
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);
    testPop(maxHeap);

    /* ヒープのサイズを取得する */
    int size = maxHeap.size();
    cout << "\nヒープの要素数： " << size << endl;

    /* ヒープが空か判定する */
    bool isEmpty = maxHeap.empty();
    cout << "\nヒープは空か： " << isEmpty << endl;

    /* 入力リストからヒープを構築する */
    // 時間計算量は O(nlogn) ではなく O(n)
    vector<int> input{1, 3, 2, 5, 4};
    priority_queue<int, vector<int>, greater<int>> minHeap(input.begin(), input.end());
    cout << "入力リストから構築した最小ヒープ：" << endl;
    printHeap(minHeap);

    return 0;
}
