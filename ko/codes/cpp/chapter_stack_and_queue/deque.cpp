/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    /* 덱 초기화 */
    deque<int> deque;

    /* 큐에 원소 삽입 */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "덱 deque = ";
    printDeque(deque);

    /* 원소 접근 */
    int front = deque.front();
    cout << "맨 앞 원소 front = " << front << endl;
    int back = deque.back();
    cout << "큐의 맨 뒤 원소 back = " << back << endl;

    /* 큐에서 원소 꺼내기 */
    deque.pop_front();
    cout << "맨 앞에서 꺼낸 원소 popFront = " << front << ", 맨 앞에서 꺼낸 후 deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "맨 뒤에서 꺼낸 원소 popLast = " << back << ", 맨 뒤에서 꺼낸 후 deque = ";
    printDeque(deque);

    /* 덱의 길이 반환 */
    int size = deque.size();
    cout << "덱 길이 size = " << size << endl;

    /* 덱이 비어 있는지 판단 */
    bool empty = deque.empty();
    cout << "덱이 비어 있는가 = " << empty << endl;

    return 0;
}
