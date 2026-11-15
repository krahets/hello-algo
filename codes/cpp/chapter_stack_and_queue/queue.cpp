/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_queue}
    /* 初始化队列 */
    queue<int> queue;
    // [endregion]{init_queue}

    // [region]{push}
    /* 元素入队 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    // [endregion]{push}
    cout << "队列 queue = ";
    printQueue(queue);

    // [region]{peek}
    /* 访问队首元素 */
    int front = queue.front();
    // [endregion]{peek}
    cout << "队首元素 front = " << front << endl;

    // [region]{pop}
    /* 元素出队 */
    queue.pop();
    // [endregion]{pop}
    cout << "出队元素 front = " << front << "，出队后 queue = ";
    printQueue(queue);

    // [region]{size}
    /* 获取队列的长度 */
    int size = queue.size();
    // [endregion]{size}
    cout << "队列长度 size = " << size << endl;

    // [region]{is_empty}
    /* 判断队列是否为空 */
    bool empty = queue.empty();
    // [endregion]{is_empty}
    cout << "队列是否为空 = " << empty << endl;

    return 0;
}
