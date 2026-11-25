/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 以陣列實作堆疊 */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* 取得堆疊長度 */
    int size() {
        return stack.size();
    }

    /* 判斷堆疊是否為空 */
    bool isEmpty() {
        return stack.size() == 0;
    }

    /* 推入堆疊 */
    void push(int num) {
        stack.push_back(num);
    }

    /* 彈出堆疊頂端的元素 */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* 讀取堆疊頂端的元素 */
    int top() {
        if (isEmpty())
            throw out_of_range("堆疊為空");
        return stack.back();
    }

    /* 回傳 vector */
    vector<int> toVector() {
        return stack;
    }
};

/* 範例程式 */
int main() {
    /* 初始化堆疊 */
    ArrayStack *stack = new ArrayStack();

    /* 將元素推入堆疊 */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "堆疊 stack = ";
    printVector(stack->toVector());

    /* 讀取堆疊頂端的元素 */
    int top = stack->top();
    cout << "堆疊頂端元素 top = " << top << endl;

    /* 從堆疊彈出元素 */
    top = stack->pop();
    cout << "彈出的元素 pop = " << top << "，彈出後 stack = ";
    printVector(stack->toVector());

    /* 取得堆疊長度 */
    int size = stack->size();
    cout << "堆疊長度 size = " << size << endl;

    /* 判斷堆疊是否為空 */
    bool empty = stack->isEmpty();
    cout << "堆疊是否為空 = " << empty << endl;

    // 釋放記憶體
    delete stack;

    return 0;
}
