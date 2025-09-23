/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 連結リストに基づくスタッククラス */
class LinkedListStack {
  private:
    ListNode *stackTop; // 先頭ノードをスタックトップとして使用
    int stkSize;        // スタックの長さ

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // 連結リストを走査、ノードを削除、メモリを解放
        freeMemoryLinkedList(stackTop);
    }

    /* スタックの長さを取得 */
    int size() {
        return stkSize;
    }

    /* スタックが空かどうかを判定 */
    bool isEmpty() {
        return size() == 0;
    }

    /* プッシュ */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* ポップ */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // メモリを解放
        delete tmp;
        stkSize--;
        return num;
    }

    /* スタックトップ要素にアクセス */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stackTop->val;
    }

    /* リストを配列に変換して返却 */
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

/* ドライバーコード */
int main() {
    /* スタックを初期化 */
    LinkedListStack *stack = new LinkedListStack();

    /* 要素プッシュ */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "Stack stack = ";
    printVector(stack->toVector());

    /* スタックトップ要素にアクセス */
    int top = stack->top();
    cout << "Top element of the stack top = " << top << endl;

    /* 要素ポップ */
    top = stack->pop();
    cout << "Element popped from the stack = " << top << ", after popping";
    printVector(stack->toVector());

    /* スタックの長さを取得 */
    int size = stack->size();
    cout << "Length of the stack size = " << size << endl;

    /* 空かどうかを判定 */
    bool empty = stack->isEmpty();
    cout << "Is the stack empty = " << empty << endl;

    // メモリを解放
    delete stack;

    return 0;
}