/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_deque}
    /* 初始化双向队列 */
    deque<int> deque;
    // [endregion]{init_deque}

    // [region]{push}
    /* 元素入队 */
    deque.push_back(2); // 添加至队尾
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // 添加至队首
    deque.push_front(1);
    // [endregion]{push}
    cout << "双向队列 deque = ";
    printDeque(deque);

    // [region]{peek_first}
    /* 访问元素 */
    int front = deque.front(); // 队首元素
    // [endregion]{peek_first}
    cout << "队首元素 front = " << front << endl;
    // [region]{peek_last}
    int back = deque.back(); // 队尾元素
    // [endregion]{peek_last}
    cout << "队尾元素 back = " << back << endl;

    // [region]{pop_first}
    /* 元素出队 */
    deque.pop_front(); // 队首元素出队
    // [endregion]{pop_first}
    cout << "队首出队元素 popFront = " << front << "，队首出队后 deque = ";
    printDeque(deque);
    // [region]{pop_last}
    deque.pop_back(); // 队尾元素出队
    // [endregion]{pop_last}
    cout << "队尾出队元素 popLast = " << back << "，队尾出队后 deque = ";
    printDeque(deque);

    // [region]{size}
    /* 获取双向队列的长度 */
    int size = deque.size();
    // [endregion]{size}
    cout << "双向队列长度 size = " << size << endl;

    // [region]{is_empty}
    /* 判断双向队列是否为空 */
    bool empty = deque.empty();
    // [endregion]{is_empty}
    cout << "双向队列是否为空 = " << empty << endl;

    return 0;
}
