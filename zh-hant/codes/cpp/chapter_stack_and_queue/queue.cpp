/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_queue}
    /* 初始化佇列 */
    queue<int> queue;
    // [endregion]{init_queue}

    // [region]{push}
    /* 元素入列 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    // [endregion]{push}
    cout << "佇列 queue = ";
    printQueue(queue);

    // [region]{peek}
    /* 訪問佇列首元素 */
    int front = queue.front();
    // [endregion]{peek}
    cout << "佇列首元素 front = " << front << endl;

    // [region]{pop}
    /* 元素出列 */
    queue.pop();
    // [endregion]{pop}
    cout << "出列元素 front = " << front << "，出列後 queue = ";
    printQueue(queue);

    // [region]{size}
    /* 獲取佇列的長度 */
    int size = queue.size();
    // [endregion]{size}
    cout << "佇列長度 size = " << size << endl;

    // [region]{is_empty}
    /* 判斷佇列是否為空 */
    bool empty = queue.empty();
    // [endregion]{is_empty}
    cout << "佇列是否為空 = " << empty << endl;

    return 0;
}
