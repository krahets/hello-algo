/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 配列で実装したスタック */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* スタックの長さを取得する */
    int size() {
        return stack.size();
    }

    /* スタックが空かどうかを判定する */
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

    /* スタックの先頭要素にアクセスする */
    int top() {
        if (isEmpty())
            throw out_of_range("スタックが空です");
        return stack.back();
    }

    /* Vector を返す */
    vector<int> toVector() {
        return stack;
    }
};

/* 実行用コード */
int main() {
    /* スタックを初期化する */
    ArrayStack *stack = new ArrayStack();

    /* 要素をプッシュする */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "スタック stack = ";
    printVector(stack->toVector());

    /* スタックの先頭要素にアクセスする */
    int top = stack->top();
    cout << "スタックの先頭要素 top = " << top << endl;

    /* 要素をポップする */
    top = stack->pop();
    cout << "ポップした要素 pop = " << top << "、ポップ後 stack = ";
    printVector(stack->toVector());

    /* スタックの長さを取得する */
    int size = stack->size();
    cout << "スタックの長さ size = " << size << endl;

    /* 空かどうかを判定する */
    bool empty = stack->isEmpty();
    cout << "スタックは空か = " << empty << endl;

    // メモリを解放する
    delete stack;

    return 0;
}
