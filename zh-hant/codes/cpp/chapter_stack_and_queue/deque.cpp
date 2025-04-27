/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 初始化雙向佇列 */
    deque<int> deque;

    /* 元素入列 */
    deque.push_back(2);
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);
    deque.push_front(1);
    cout << "雙向佇列 deque = ";
    printDeque(deque);

    /* 訪問元素 */
    int front = deque.front();
    cout << "佇列首元素 front = " << front << endl;
    int back = deque.back();
    cout << "佇列尾元素 back = " << back << endl;

    /* 元素出列 */
    deque.pop_front();
    cout << "佇列首出列元素 popFront = " << front << "，佇列首出列後 deque = ";
    printDeque(deque);
    deque.pop_back();
    cout << "佇列尾出列元素 popLast = " << back << "，佇列尾出列後 deque = ";
    printDeque(deque);

    /* 獲取雙向佇列的長度 */
    int size = deque.size();
    cout << "雙向佇列長度 size = " << size << endl;

    /* 判斷雙向佇列是否為空 */
    bool empty = deque.empty();
    cout << "雙向佇列是否為空 = " << empty << endl;

    return 0;
}
