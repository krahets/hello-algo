/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 配列に基づくスタッククラス */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* スタックの長さを取得 */
    int size() {
        return stack.size();
    }

    /* スタックが空かどうかを判定 */
    bool isEmpty() {
        return stack.size() == 0;
    }

    /* プッシュ */
    void push(int num) {
        stack.push_back(num);
    }

    /* ポップ */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* スタックトップ要素にアクセス */
    int top() {
        if (isEmpty())
            throw out_of_range("Stack is empty");
        return stack.back();
    }

    /* Vectorを返却 */
    vector<int> toVector() {
        return stack;
    }
};

/* ドライバーコード */
int main() {
    /* スタックを初期化 */
    ArrayStack *stack = new ArrayStack();

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