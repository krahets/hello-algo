/**
 * File: linkedlist_stack.cpp
 * Created Time: 2022-11-28
 * Author: qualifier1024 (2539244001@qq.com)
 */

#include "../utils/common.hpp"

/* 基於鏈結串列實現的堆疊 */
class LinkedListStack {
  private:
    ListNode *stackTop; // 將頭節點作為堆疊頂
    int stkSize;        // 堆疊的長度

  public:
    LinkedListStack() {
        stackTop = nullptr;
        stkSize = 0;
    }

    ~LinkedListStack() {
        // 走訪鏈結串列刪除節點，釋放記憶體
        freeMemoryLinkedList(stackTop);
    }

    /* 獲取堆疊的長度 */
    int size() {
        return stkSize;
    }

    /* 判斷堆疊是否為空 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 入堆疊 */
    void push(int num) {
        ListNode *node = new ListNode(num);
        node->next = stackTop;
        stackTop = node;
        stkSize++;
    }

    /* 出堆疊 */
    int pop() {
        int num = top();
        ListNode *tmp = stackTop;
        stackTop = stackTop->next;
        // 釋放記憶體
        delete tmp;
        stkSize--;
        return num;
    }

    /* 訪問堆疊頂元素 */
    int top() {
        if (isEmpty())
            throw out_of_range("堆疊為空");
        return stackTop->val;
    }

    /* 將 List 轉化為 Array 並返回 */
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
    /* 初始化堆疊 */
    LinkedListStack *stack = new LinkedListStack();

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
