/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 初始化佇列 */
    queue<int> queue;

    /* 元素入列 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "佇列 queue = ";
    printQueue(queue);

    /* 訪問佇列首元素 */
    int front = queue.front();
    cout << "佇列首元素 front = " << front << endl;

    /* 元素出列 */
    queue.pop();
    cout << "出列元素 front = " << front << "，出列後 queue = ";
    printQueue(queue);

    /* 獲取佇列的長度 */
    int size = queue.size();
    cout << "佇列長度 size = " << size << endl;

    /* 判斷佇列是否為空 */
    bool empty = queue.empty();
    cout << "佇列是否為空 = " << empty << endl;

    return 0;
}
