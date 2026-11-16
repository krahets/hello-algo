/**
 * File: deque.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    // [region]{init_deque}
    /* 덱 초기화 */
    deque<int> deque;
    // [endregion]{init_deque}

    // [region]{push}
    /* 원소 삽입 */
    deque.push_back(2); // 맨 뒤에 추가한다
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // 맨 앞에 추가한다
    deque.push_front(1);
    // [endregion]{push}
    cout << "덱 deque = ";
    printDeque(deque);

    // [region]{peek_first}
    /* 원소 접근 */
    int front = deque.front(); // 맨 앞 원소
    // [endregion]{peek_first}
    cout << "맨 앞 원소 front = " << front << endl;
    // [region]{peek_last}
    int back = deque.back(); // 맨 뒤 원소
    // [endregion]{peek_last}
    cout << "큐의 맨 뒤 원소 back = " << back << endl;

    // [region]{pop_first}
    /* 원소 꺼내기 */
    deque.pop_front(); // 맨 앞 원소를 꺼낸다
    // [endregion]{pop_first}
    cout << "맨 앞에서 꺼낸 원소 popFront = " << front << ", 맨 앞에서 꺼낸 후 deque = ";
    printDeque(deque);
    // [region]{pop_last}
    deque.pop_back(); // 맨 뒤 원소를 꺼낸다
    // [endregion]{pop_last}
    cout << "맨 뒤에서 꺼낸 원소 popLast = " << back << ", 맨 뒤에서 꺼낸 후 deque = ";
    printDeque(deque);

    // [region]{size}
    /* 덱의 길이 반환 */
    int size = deque.size();
    // [endregion]{size}
    cout << "덱 길이 size = " << size << endl;

    // [region]{is_empty}
    /* 덱이 비어 있는지 판단 */
    bool empty = deque.empty();
    // [endregion]{is_empty}
    cout << "덱이 비어 있는가 = " << empty << endl;

    return 0;
}
