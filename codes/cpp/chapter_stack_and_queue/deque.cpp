/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 初始化双向队列 */
    deque<int> deque;

    /* 元素入队 */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "双向队列 deque = ";
    printDeque(deque);

    /* 访问元素 */
    int front = deque.front();
    cout << "队首元素 front = " << front << endl;
    int back = deque.back();
    cout << "队尾元素 back = " << back << endl;

    /* 元素出队 */
    deque.pop_front();
    cout << "队首出队元素 popFront = " << front << "，队首出队后 deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "队尾出队元素 popLast = " << back << "，队尾出队后 deque = ";
    printDeque(deque);

    /* 获取双向队列的长度 */
    int size = deque.size();
    cout << "双向队列长度 size = " << size << endl;

    /* 判断双向队列是否为空 */
    bool empty = deque.empty();
    cout << "双向队列是否为空 = " << empty << endl;

    return 0;
}
