/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    /* キューを初期化する */
    queue<int> queue;

    /* 要素をエンキューする */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "キュー queue = ";
    printQueue(queue);

    /* キューの先頭要素にアクセス */
    int front = queue.front();
    cout << "キューの先頭要素 front = " << front << endl;

    /* 要素をデキューする */
    queue.pop();
    cout << "デキューした要素 front = " << front << "、デキュー後 queue = ";
    printQueue(queue);

    /* キューの長さを取得 */
    int size = queue.size();
    cout << "キューの長さ size = " << size << endl;

    /* キューが空か判定 */
    bool empty = queue.empty();
    cout << "キューは空か = " << empty << endl;

    return 0;
}
