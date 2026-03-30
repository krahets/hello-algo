/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 連結リストベースのスタック */
class LinkedListStack {
  private:
    ListNode *stackTop; // 先頭ノードをスタックトップとする
    int stkSize;        // スタックの長さ

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // 連結リストを走査してノードを削除し、メモリを解放する
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
        // メモリを解放する
        delete tmp;
        stkSize--;
        return num;
    }

    /* スタックトップの要素にアクセス */
    int top() {
        if (isEmpty())
            throw out_of_range("スタックが空です");
        return stackTop->val;
    }

    /* List を Array に変換して返す */
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

/* Driver Code */
int main() {
    /* スタックを初期化 */
    LinkedListStack *stack = new LinkedListStack();

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
