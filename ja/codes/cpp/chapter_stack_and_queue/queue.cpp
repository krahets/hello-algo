/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* ドライバーコード */
int main() {
    /* キューを初期化 */
    queue<int> queue;

    /* 要素エンキュー */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "Queue queue = ";
    printQueue(queue);

    /* 先頭要素にアクセス */
    int front = queue.front();
    cout << "Front element of the queue front = " << front << endl;

    /* 要素デキュー */
    queue.pop();
    cout << "Element dequeued = " << front << ", after dequeuing";
    printQueue(queue);

    /* キューの長さを取得 */
    int size = queue.size();
    cout << "Length of the queue size = " << size << endl;

    /* キューが空かどうかを判定 */
    bool empty = queue.empty();
    cout << "Is the queue empty = " << empty << endl;

    return 0;
}