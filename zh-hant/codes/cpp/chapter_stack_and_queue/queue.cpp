/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 範例程式 */
int main() {
    /* 初始化佇列 */
    queue<int> queue;

    /* 將元素加入佇列 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "佇列 queue = ";
    printQueue(queue);

    /* 讀取隊首元素 */
    int front = queue.front();
    cout << "隊首元素 front = " << front << endl;

    /* 從佇列移除元素 */
    queue.pop();
    cout << "出隊元素 front = " << front << "，出隊後 queue = ";
    printQueue(queue);

    /* 取得佇列長度 */
    int size = queue.size();
    cout << "佇列長度 size = " << size << endl;

    /* 判斷佇列是否為空 */
    bool empty = queue.empty();
    cout << "佇列是否為空 = " << empty << endl;

    return 0;
}
