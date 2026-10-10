/**
 * File: array_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 配列ベースのスタック */
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

    /* スタックトップの要素にアクセス */
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

/* Driver Code */
int main() {
    /* スタックを初期化 */
    ArrayStack *stack = new ArrayStack();

    /* 要素をプッシュ */
    stack->push(1);
    stack->push(3);
    stack->push(2);
    stack->push(5);
    stack->push(4);
    cout << "スタック stack = ";
    printVector(stack->toVector());

    /* スタックトップの要素にアクセス */
    int top = stack->top();
    cout << "トップ要素 top = " << top << endl;

    /* 要素をポップ */
    top = stack->pop();
    cout << "取り出した要素 pop = " << top << "、取り出し後の stack = ";
    printVector(stack->toVector());

    /* スタックの長さを取得 */
    int size = stack->size();
    cout << "スタックの長さ size = " << size << endl;

    /* 空かどうかを判定 */
    bool empty = stack->isEmpty();
    cout << "スタックが空かどうか = " << empty << endl;

    // メモリを解放する
    delete stack;

    return 0;
}
