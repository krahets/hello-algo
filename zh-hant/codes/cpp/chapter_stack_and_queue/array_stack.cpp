/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 基於陣列實現的堆疊 */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* 獲取堆疊的長度 */
    int size() {
        return stack.size();
    }

    /* 判斷堆疊是否為空 */
    bool isEmpty() {
        return stack.size() == 0;
    }

    /* 入堆疊 */
    void push(int num) {
        stack.push_back(num);
    }

    /* 出堆疊 */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* 訪問堆疊頂元素 */
    int top() {
        if (isEmpty())
            throw out_of_range("堆疊為空");
        return stack.back();
    }

    /* 返回 Vector */
    vector<int> toVector() {
        return stack;
    }
};

/* Driver Code */
int main() {
    /* 初始化堆疊 */
    ArrayStack *stack = new ArrayStack();

    /* 元素入堆疊 */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "堆疊 stack = ";
    printVector(stack->toVector());

    /* 訪問堆疊頂元素 */
    int top = stack->top();
    cout << "堆疊頂元素 top = " << top << endl;

    /* 元素出堆疊 */
    top = stack->pop();
    cout << "出堆疊元素 pop = " << top << "，出堆疊後 stack = ";
    printVector(stack->toVector());

    /* 獲取堆疊的長度 */
    int size = stack->size();
    cout << "堆疊的長度 size = " << size << endl;

    /* 判斷是否為空 */
    bool empty = stack->isEmpty();
    cout << "堆疊是否為空 = " << empty << endl;

    // 釋放記憶體
    delete stack;

    return 0;
}
