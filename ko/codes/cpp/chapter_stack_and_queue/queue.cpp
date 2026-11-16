/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    // [region]{init_queue}
    /* 큐 초기화 */
    queue<int> queue;
    // [endregion]{init_queue}

    // [region]{push}
    /* 원소 삽입 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    // [endregion]{push}
    cout << "큐 queue = ";
    printQueue(queue);

    // [region]{peek}
    /* 맨 앞 원소 접근 */
    int front = queue.front();
    // [endregion]{peek}
    cout << "맨 앞 원소 front = " << front << endl;

    // [region]{pop}
    /* 원소 꺼내기 */
    queue.pop();
    // [endregion]{pop}
    cout << "큐에서 꺼낸 원소 front = " << front << ", 큐에서 꺼낸 후 queue = ";
    printQueue(queue);

    // [region]{size}
    /* 큐의 길이 반환 */
    int size = queue.size();
    // [endregion]{size}
    cout << "큐 길이 size = " << size << endl;

    // [region]{is_empty}
    /* 큐가 비어 있는지 판단 */
    bool empty = queue.empty();
    // [endregion]{is_empty}
    cout << "큐가 비어 있는가 = " << empty << endl;

    return 0;
}
