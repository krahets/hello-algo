/**
 * File: linkedlist_deque.cpp
 * Created Time: 2023-03-02
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 雙向鏈結串列節點 */
struct DoublyListNode {
    int val;              // 節點值
    DoublyListNode *next; // 後繼節點指標
    DoublyListNode *prev; // 前驅節點指標
    DoublyListNode(int val) : val(val), prev(nullptr), next(nullptr) {
    }
};

/* 基於雙向鏈結串列實現的雙向佇列 */
class LinkedListDeque {
  private:
    DoublyListNode *front, *rear; // 頭節點 front ，尾節點 rear
    int queSize = 0;              // 雙向佇列的長度

  public:
    /* 建構子 */
    LinkedListDeque() : front(nullptr), rear(nullptr) {
    }

    /* 析構方法 */
    ~LinkedListDeque() {
        // 走訪鏈結串列刪除節點，釋放記憶體
        DoublyListNode *pre, *cur = front;
        while (cur != nullptr) {
            pre = cur;
            cur = cur->next;
            delete pre;
        }
    }

    /* 獲取雙向佇列的長度 */
    int size() {
        return queSize;
    }

    /* 判斷雙向佇列是否為空 */
    bool isEmpty() {
        return size() == 0;
    }

    /* 入列操作 */
    void push(int num, bool isFront) {
        DoublyListNode *node = new DoublyListNode(num);
        // 若鏈結串列為空，則令 front 和 rear 都指向 node
        if (isEmpty())
            front = rear = node;
        // 佇列首入列操作
        else if (isFront) {
            // 將 node 新增至鏈結串列頭部
            front->prev = node;
            node->next = front;
            front = node; // 更新頭節點
        // 佇列尾入列操作
        } else {
            // 將 node 新增至鏈結串列尾部
            rear->next = node;
            node->prev = rear;
            rear = node; // 更新尾節點
        }
        queSize++; // 更新佇列長度
    }

    /* 佇列首入列 */
    void pushFirst(int num) {
        push(num, true);
    }

    /* 佇列尾入列 */
    void pushLast(int num) {
        push(num, false);
    }

    /* 出列操作 */
    int pop(bool isFront) {
        if (isEmpty())
            throw out_of_range("佇列為空");
        int val;
        // 佇列首出列操作
        if (isFront) {
            val = front->val; // 暫存頭節點值
            // 刪除頭節點
            DoublyListNode *fNext = front->next;
            if (fNext != nullptr) {
                fNext->prev = nullptr;
                front->next = nullptr;
            }
            delete front;
            front = fNext; // 更新頭節點
        // 佇列尾出列操作
        } else {
            val = rear->val; // 暫存尾節點值
            // 刪除尾節點
            DoublyListNode *rPrev = rear->prev;
            if (rPrev != nullptr) {
                rPrev->next = nullptr;
                rear->prev = nullptr;
            }
            delete rear;
            rear = rPrev; // 更新尾節點
        }
        queSize--; // 更新佇列長度
        return val;
    }

    /* 佇列首出列 */
    int popFirst() {
        return pop(true);
    }

    /* 佇列尾出列 */
    int popLast() {
        return pop(false);
    }

    /* 訪問佇列首元素 */
    int peekFirst() {
        if (isEmpty())
            throw out_of_range("雙向佇列為空");
        return front->val;
    }

    /* 訪問佇列尾元素 */
    int peekLast() {
        if (isEmpty())
            throw out_of_range("雙向佇列為空");
        return rear->val;
    }

    /* 返回陣列用於列印 */
    vector<int> toVector() {
        DoublyListNode *node = front;
        vector<int> res(size());
        for (int i = 0; i < res.size(); i++) {
            res[i] = node->val;
            node = node->next;
        }
        return res;
    }
};

/* Driver Code */
int main() {
    /* 初始化雙向佇列 */
    LinkedListDeque *deque = new LinkedListDeque();
    deque->pushLast(3);
    deque->pushLast(2);
    deque->pushLast(5);
    cout << "雙向佇列 deque = ";
    printVector(deque->toVector());

    /* 訪問元素 */
    int peekFirst = deque->peekFirst();
    cout << "佇列首元素 peekFirst = " << peekFirst << endl;
    int peekLast = deque->peekLast();
    cout << "佇列尾元素 peekLast = " << peekLast << endl;

    /* 元素入列 */
    deque->pushLast(4);
    cout << "元素 4 佇列尾入列後 deque =";
    printVector(deque->toVector());
    deque->pushFirst(1);
    cout << "元素 1 佇列首入列後 deque = ";
    printVector(deque->toVector());

    /* 元素出列 */
    int popLast = deque->popLast();
    cout << "佇列尾出列元素 = " << popLast << "，佇列尾出列後 deque = ";
    printVector(deque->toVector());
    int popFirst = deque->popFirst();
    cout << "佇列首出列元素 = " << popFirst << "，佇列首出列後 deque = ";
    printVector(deque->toVector());

    /* 獲取雙向佇列的長度 */
    int size = deque->size();
    cout << "雙向佇列長度 size = " << size << endl;

    /* 判斷雙向佇列是否為空 */
    bool isEmpty = deque->isEmpty();
    cout << "雙向佇列是否為空 = " << boolalpha << isEmpty << endl;

    // 釋放記憶體
    delete deque;

    return 0;
}
