/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 配列を使ったスタック */
class ArrayStack {
  private:
    vector<int> stack;

  public:
    /* スタックの要素数を取得する */
    int size() {
        return stack.size();
    }

    /* スタックが空かどうかを判定する */
    bool isEmpty() {
        return stack.size() == 0;
    }

    /* プッシュする */
    void push(int num) {
        stack.push_back(num);
    }

    /* ポップする */
    int pop() {
        int num = top();
        stack.pop_back();
        return num;
    }

    /* スタックのトップを参照する */
    int top() {
        if (isEmpty())
            throw out_of_range("スタックが空です");
        return stack.back();
    }

    /* vector を返す */
    vector<int> toVector() {
        return stack;
    }
};

/* 実行例 */
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

    /* スタックのトップを参照する */
    int top = stack->top();
    cout << "スタックのトップの要素 top = " << top << endl;

    /* 要素をポップする */
    top = stack->pop();
    cout << "ポップした要素 pop = " << top << "、ポップ後の stack = ";
    printVector(stack->toVector());

    /* スタックの要素数を取得する */
    int size = stack->size();
    cout << "スタックの要素数 size = " << size << endl;

    /* 空かどうかを判定する */
    bool empty = stack->isEmpty();
    cout << "スタックは空か = " << empty << endl;

    // メモリを解放する
    delete stack;

    return 0;
}
