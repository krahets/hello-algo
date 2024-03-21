/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 初始化队列 */
    queue<int> queue;

    /* 元素入队 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "队列 queue = ";
    printQueue(queue);

    /* 访问队首元素 */
    int front = queue.front();
    cout << "队首元素 front = " << front << endl;

    /* 元素出队 */
    queue.pop();
    cout << "出队元素 front = " << front << "，出队后 queue = ";
    printQueue(queue);

    /* 获取队列的长度 */
    int size = queue.size();
    cout << "队列长度 size = " << size << endl;

    /* 判断队列是否为空 */
    bool empty = queue.empty();
    cout << "队列是否为空 = " << empty << endl;

    return 0;
}
