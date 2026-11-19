/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 実行用コード */
int main() {
    // [region]{init_queue}
    /* キューを初期化する */
    queue<int> queue;
    // [endregion]{init_queue}

    // [region]{push}
    /* 要素をエンキューする */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    // [endregion]{push}
    cout << "キュー queue = ";
    printQueue(queue);

    // [region]{peek}
    /* キューの先頭要素にアクセス */
    int front = queue.front();
    // [endregion]{peek}
    cout << "キューの先頭要素 front = " << front << endl;

    // [region]{pop}
    /* 要素をデキューする */
    queue.pop();
    // [endregion]{pop}
    cout << "デキューした要素 front = " << front << "、デキュー後 queue = ";
    printQueue(queue);

    // [region]{size}
    /* キューの長さを取得 */
    int size = queue.size();
    // [endregion]{size}
    cout << "キューの長さ size = " << size << endl;

    // [region]{is_empty}
    /* キューが空か判定 */
    bool empty = queue.empty();
    // [endregion]{is_empty}
    cout << "キューは空か = " << empty << endl;

    return 0;
}
