/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 範例程式 */
int main() {
    /* 初始化雙端佇列 */
    deque<int> deque;

    /* 將元素加入雙端佇列 */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "雙端佇列 deque = ";
    printDeque(deque);

    /* 讀取隊首與隊尾元素 */
    int front = deque.front();
    cout << "隊首元素 front = " << front << endl;
    int back = deque.back();
    cout << "隊尾元素 back = " << back << endl;

    /* 從雙端佇列移除元素 */
    deque.pop_front();
    cout << "從隊首取出的元素 popFront = " << front << "，從隊首取出後 deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "從隊尾取出的元素 popLast = " << back << "，從隊尾取出後 deque = ";
    printDeque(deque);

    /* 取得雙端佇列長度 */
    int size = deque.size();
    cout << "雙端佇列長度 size = " << size << endl;

    /* 判斷雙端佇列是否為空 */
    bool empty = deque.empty();
    cout << "雙端佇列是否為空 = " << empty << endl;

    return 0;
}
