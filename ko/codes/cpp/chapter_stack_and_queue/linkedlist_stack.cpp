/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 연결 리스트로 구현한 스택 */
class LinkedListStack {
  private:
    ListNode *stackTop; // 머리 노드를 스택의 맨 위로 사용한다
    int stkSize;        // 스택의 길이

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // 연결 리스트를 순회하며 노드를 삭제하여 메모리를 해제한다
        freeMemoryLinkedList(stackTop);
    }

    /* 스택의 길이 반환 */
    int size() {
        return stkSize;
    }

    /* 스택이 비어 있는지 판단 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 스택에 삽입 */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* 스택에서 꺼내기 */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // 메모리 해제
        delete tmp;
        stkSize--;
        return num;
    }

    /* 스택 맨 위 원소 접근 */
    int top() {
        if (isEmpty())
            throw out_of_range("스택이 비어 있다");
        return stackTop->val;
    }

    /* List를 Array로 변환하여 반환 */
    vector<int> toVector() {
        ListNode *node = stackTop;
        vector<int> res(size());
        for (int i = res.size() - 1; i >= 0; i--) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* 실행 코드 */
int main() {
    /* 스택 초기화 */
    LinkedListStack *stack = new LinkedListStack();

    /* 스택에 원소 삽입 */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "스택 stack = ";
    printVector(stack->toVector());

    /* 스택 맨 위 원소 접근 */
    int top = stack->top();
    cout << "스택의 맨 위 원소 top = " << top << endl;

    /* 스택에서 원소 꺼내기 */
    top = stack->pop();
    cout << "스택에서 꺼낸 원소 pop = " << top << ", 스택에서 꺼낸 후 stack = ";
    printVector(stack->toVector());

    /* 스택의 길이 반환 */
    int size = stack->size();
    cout << "스택의 길이 size = " << size << endl;

    /* 비어 있는지 판단 */
    bool empty = stack->isEmpty();
    cout << "스택이 비어 있는가 = " << empty << endl;

    // 메모리 해제
    delete stack;

    return 0;
}
