/**
 * File: queue.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    /* 큐 초기화 */
    queue<int> queue;

    /* 큐에 원소 삽입 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    cout << "큐 queue = ";
    printQueue(queue);

    /* 맨 앞 원소 접근 */
    int front = queue.front();
    cout << "맨 앞 원소 front = " << front << endl;

    /* 큐에서 원소 꺼내기 */
    queue.pop();
    cout << "큐에서 꺼낸 원소 front = " << front << ", 큐에서 꺼낸 후 queue = ";
    printQueue(queue);

    /* 큐의 길이 반환 */
    int size = queue.size();
    cout << "큐 길이 size = " << size << endl;

    /* 큐가 비어 있는지 판단 */
    bool empty = queue.empty();
    cout << "큐가 비어 있는가 = " << empty << endl;

    return 0;
}
