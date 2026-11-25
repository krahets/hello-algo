/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 連結リストを使ったスタック */
class LinkedListStack {
  private:
    ListNode *stackTop; // 先頭ノードをスタックのトップとする
    int stkSize;        // スタックの要素数

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // 連結リストをたどり、各ノードを削除してメモリを解放する
        freeMemoryLinkedList(stackTop);
    }

    /* スタックの要素数を取得する */
    int size() {
        return stkSize;
    }

    /* スタックが空かどうかを判定する */
    bool isEmpty() {
        return size() == 0;
    }

    /* プッシュする */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* ポップする */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // メモリを解放する
        delete tmp;
        stkSize--;
        return num;
    }

    /* スタックのトップを参照する */
    int top() {
        if (isEmpty())
            throw out_of_range("スタックが空です");
        return stackTop->val;
    }

    /* 連結リストを vector に変換して返す */
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

/* 実行例 */
int main() {
    /* スタックを初期化する */
    LinkedListStack *stack = new LinkedListStack();

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
