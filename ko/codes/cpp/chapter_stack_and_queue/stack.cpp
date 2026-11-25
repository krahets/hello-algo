/**
 * File: stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 실행 예제 */
int main() {
    /* 스택 초기화 */
    stack<int> stack;

    /* 스택에 원소 삽입 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    cout << "스택 stack = ";
    printStack(stack);

    /* 스택 맨 위의 원소 조회 */
    int top = stack.top();
    cout << "맨 위 원소 top = " << top << endl;

    /* 스택에서 원소 꺼내기 */
    stack.pop(); // 반환값 없음
    cout << "꺼낸 원소 pop = " << top << ", 꺼낸 후 stack = ";
    printStack(stack);

    /* 스택의 길이 조회 */
    int size = stack.size();
    cout << "스택의 길이 size = " << size << endl;

    /* 비어 있는지 확인 */
    bool empty = stack.empty();
    cout << "스택이 비어 있는가 = " << empty << endl;

    return 0;
}
