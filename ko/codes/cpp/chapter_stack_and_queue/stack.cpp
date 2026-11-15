/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    // [region]{init_stack}
    /* 스택 초기화 */
    stack<int> stack;
    // [endregion]{init_stack}

    // [region]{push}
    /* 스택에 원소 삽입 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    cout << "스택 stack = ";
    printStack(stack);

    // [region]{peek}
    /* 스택 맨 위 원소 접근 */
    int top = stack.top();
    // [endregion]{peek}
    cout << "스택의 맨 위 원소 top = " << top << endl;

    // [region]{pop}
    /* 스택에서 원소 꺼내기 */
    stack.pop(); // 반환값 없음
    // [endregion]{pop}
    cout << "스택에서 꺼낸 원소 pop = " << top << ", 스택에서 꺼낸 후 stack = ";
    printStack(stack);

    // [region]{size}
    /* 스택의 길이 반환 */
    int size = stack.size();
    // [endregion]{size}
    cout << "스택의 길이 size = " << size << endl;

    // [region]{is_empty}
    /* 비어 있는지 판단 */
    bool empty = stack.empty();
    // [endregion]{is_empty}
    cout << "스택이 비어 있는가 = " << empty << endl;

    return 0;
}
