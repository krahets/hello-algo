/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 実行例 */
int main() {
    /* キューを初期化する */
    queue<int> queue;

    /* 要素をキューに追加する */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "キュー queue = ";
    printQueue(queue);

    /* キューの先頭要素を参照する */
    int front = queue.front();
    cout << "先頭要素 front = " << front << endl;

    /* キューから要素を取り出す */
    queue.pop();
    cout << "デキューした要素 front = " << front << "、デキュー後の queue = ";
    printQueue(queue);

    /* キューの要素数を取得する */
    int size = queue.size();
    cout << "キューの要素数 size = " << size << endl;

    /* キューが空かどうかを判定する */
    bool empty = queue.empty();
    cout << "キューは空か = " << empty << endl;

    return 0;
}
