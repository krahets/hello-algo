/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 以鏈結串列實作堆疊 */
class LinkedListStack {
  private:
    ListNode *stackTop; // 以首節點作為堆疊頂端
    int stkSize;        // 堆疊長度

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // 走訪鏈結串列，逐一刪除節點並釋放記憶體
        freeMemoryLinkedList(stackTop);
    }

    /* 取得堆疊長度 */
    int size() {
        return stkSize;
    }

    /* 判斷堆疊是否為空 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 推入堆疊 */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* 彈出堆疊頂端的元素 */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // 釋放已移除節點的記憶體
        delete tmp;
        stkSize--;
        return num;
    }

    /* 讀取堆疊頂端的元素 */
    int top() {
        if (isEmpty())
            throw out_of_range("堆疊為空");
        return stackTop->val;
    }

    /* 將鏈結串列轉成 vector 並回傳 */
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

/* 範例程式 */
int main() {
    /* 初始化堆疊 */
    LinkedListStack *stack = new LinkedListStack();

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
