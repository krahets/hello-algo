/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* キューを初期化 */
    queue<int> queue;

    /* 要素をエンキュー */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "キュー queue = ";
    printQueue(queue);

    /* キュー先頭の要素にアクセス */
    int front = queue.front();
    cout << "先頭要素 front = " << front << endl;

    /* 要素をデキュー */
    queue.pop();
    cout << "取り出した要素 front = " << front << "、取り出し後の queue = ";
    printQueue(queue);

    /* キューの長さを取得 */
    int size = queue.size();
    cout << "キューの長さ size = " << size << endl;

    /* キューが空かどうかを判定 */
    bool empty = queue.empty();
    cout << "キューが空かどうか = " << empty << endl;

    return 0;
}
