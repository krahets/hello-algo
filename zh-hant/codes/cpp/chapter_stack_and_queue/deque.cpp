/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    // [region]{init_deque}
    /* 初始化雙向佇列 */
    deque<int> deque;
    // [endregion]{init_deque}

    // [region]{push}
    /* 元素入列 */
    deque.push_back(2); // 新增至佇列尾
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // 新增至佇列首
    deque.push_front(1);
    // [endregion]{push}
    cout << "雙向佇列 deque = ";
    printDeque(deque);

    // [region]{peek_first}
    /* 訪問元素 */
    int front = deque.front(); // 佇列首元素
    // [endregion]{peek_first}
    cout << "佇列首元素 front = " << front << endl;
    // [region]{peek_last}
    int back = deque.back(); // 佇列尾元素
    // [endregion]{peek_last}
    cout << "佇列尾元素 back = " << back << endl;

    // [region]{pop_first}
    /* 元素出列 */
    deque.pop_front(); // 佇列首元素出列
    // [endregion]{pop_first}
    cout << "佇列首出列元素 popFront = " << front << "，佇列首出列後 deque = ";
    printDeque(deque);
    // [region]{pop_last}
    deque.pop_back(); // 佇列尾元素出列
    // [endregion]{pop_last}
    cout << "佇列尾出列元素 popLast = " << back << "，佇列尾出列後 deque = ";
    printDeque(deque);

    // [region]{size}
    /* 獲取雙向佇列的長度 */
    int size = deque.size();
    // [endregion]{size}
    cout << "雙向佇列長度 size = " << size << endl;

    // [region]{is_empty}
    /* 判斷雙向佇列是否為空 */
    bool empty = deque.empty();
    // [endregion]{is_empty}
    cout << "雙向佇列是否為空 = " << empty << endl;

    return 0;
}
